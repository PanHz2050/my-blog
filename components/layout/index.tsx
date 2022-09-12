import Footer from 'components/Footer';
import Navbar from 'components/Navbar';
import type { NextPage } from 'next';
import Head from 'next/head';

const Layout: NextPage = ({ children }) => {
  return (
    <div>
      <Head>
        <link rel="shortcut icon" href="../../static/favicon.png" />
      </Head>
      <Navbar />
      <main>{children}</main>
      <Footer />
    </div>
  );
};

export default Layout;
