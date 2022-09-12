import { ironOptions } from 'config/index';
import { format } from 'date-fns';
import { withIronSessionApiRoute } from 'iron-session/next';
import { encode } from 'js-base64';
import md5 from 'md5';
import { NextApiRequest, NextApiResponse } from 'next';
import { ISession } from 'pages/api/index';
import request from 'service/fetch';

export default withIronSessionApiRoute(sendVerifyCode, ironOptions);

async function sendVerifyCode(req: NextApiRequest, res: NextApiResponse) {
  const session: ISession = req.session;
  const { to = '', templateId = '1' } = req.body;
  const AppId = '8aaf07087d7fb5f6017d950ce83f04e1';
  const AccountId = '8aaf07087d7fb5f6017d950ce72c04da';
  const AuthToken = '91725ff244364cda9f1e1ea7d471e124';
  const NowDate = format(new Date(), 'yyyyMMddHHmmss'); //时间戳
  const SigParameter = md5(`${AccountId}${AuthToken}${NowDate}`);
  const Authorization = encode(`${AccountId}:${NowDate}`);
  const verifyCode = 1234
  // const verifyCode = Math.floor(Math.random() * (9999 - 1000)) + 1000; //自己生成的验证码
  const expireMinute = '5';
  const url = `https://app.cloopen.com:8883/2013-12-26/Accounts/${AccountId}/SMS/TemplateSMS?sig=${SigParameter}`;

  const response = await request.post(
    url,
    {
      to,
      templateId,
      appId: AppId,
      datas: [verifyCode, expireMinute],
    },
    {
      headers: {
        Authorization,
      },
    }
  );

  const response1 = {
    statusCode: '000000',
    statusMsg: '[短信]123',
    templateSMS: '飒飒大乔王企鹅群翁'
  }
    
  const { statusCode, templateSMS, statusMsg } = response1 as any;
  
  // console.log(response);

  if (statusCode === '000000') {
    session.verifyCode = verifyCode;
    await session.save();
    res.status(200).json({
      code: 0,
      msg: statusMsg,
      data: {
        templateSMS
      }
    });
  } else {
    res.status(200).json({
      code: statusCode,
      msg: statusMsg
    });
  }
}
