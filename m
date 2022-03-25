Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D44E7AB8
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Mar 2022 21:53:05 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-gIzTH_ZuPqK8dFvKlhOooA-1; Fri, 25 Mar 2022 16:53:01 -0400
X-MC-Unique: gIzTH_ZuPqK8dFvKlhOooA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C680B9219A0;
	Fri, 25 Mar 2022 20:52:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CD0A5EE6B9;
	Fri, 25 Mar 2022 20:52:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 520B81940352;
	Fri, 25 Mar 2022 20:52:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E563F1940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 20:52:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21BEB5EE6B2; Fri, 25 Mar 2022 20:52:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D8405ED83F
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 20:52:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC0551C05ADD
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 20:52:39 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-bau5kfPsMqGEPbpzmYtZjg-1; Fri, 25 Mar 2022 16:52:30 -0400
X-MC-Unique: bau5kfPsMqGEPbpzmYtZjg-1
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="238653261"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="238653261"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 13:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="826145419"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2022 13:52:24 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nXqv2-000Mad-9K; Fri, 25 Mar 2022 20:52:24 +0000
Date: Sat, 26 Mar 2022 04:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
 linux-erofs@lists.ozlabs.org
Message-ID: <202203260406.Ay5o7T9U-lkp@intel.com>
References: <20220325122223.102958-4-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220325122223.102958-4-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH v6 03/22] cachefiles: notify user daemon
 with anon_fd when looking up cookie
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: kbuild-all@lists.01.org, gregkh@linuxfoundation.org, fannaihao@baidu.com,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 tianzichen@kuaishou.com, joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jeffle,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on rostedt-trace/for-next linus/master v5.17]
[cannot apply to xiang-erofs/dev-test dhowells-fs/fscache-next next-20220325]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeffle-Xu/fscache-erofs-fscache-based-on-demand-read-semantics/20220325-203555
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
config: csky-defconfig (https://download.01.org/0day-ci/archive/20220326/202203260406.Ay5o7T9U-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ec8aa2f84eb47244377e4b822dd77d82ee54714a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeffle-Xu/fscache-erofs-fscache-based-on-demand-read-semantics/20220325-203555
        git checkout ec8aa2f84eb47244377e4b822dd77d82ee54714a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   csky-linux-ld: fs/cachefiles/daemon.o: in function `cachefiles_ondemand_daemon_read':
>> daemon.c:(.text+0x97c): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/interface.o: in function `cachefiles_ondemand_daemon_read':
   interface.c:(.text+0x1ec): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/io.o: in function `cachefiles_ondemand_daemon_read':
   io.c:(.text+0x720): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/key.o: in function `cachefiles_ondemand_daemon_read':
   key.c:(.text+0x0): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/main.o: in function `cachefiles_ondemand_daemon_read':
   main.c:(.text+0x0): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/namei.o: in function `cachefiles_ondemand_daemon_read':
   namei.c:(.text+0xf8): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/security.o: in function `cachefiles_ondemand_daemon_read':
   security.c:(.text+0x24): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/volume.o: in function `cachefiles_ondemand_daemon_read':
   volume.c:(.text+0x0): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here
   csky-linux-ld: fs/cachefiles/xattr.o: in function `cachefiles_ondemand_daemon_read':
   xattr.c:(.text+0x0): multiple definition of `cachefiles_ondemand_daemon_read'; fs/cachefiles/cache.o:cache.c:(.text+0x18): first defined here

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

