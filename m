Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 800664E7B22
	for <lists+linux-cachefs@lfdr.de>; Sat, 26 Mar 2022 00:27:34 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-1UTmIjIfNNm3_OknrNcsXw-1; Fri, 25 Mar 2022 19:27:30 -0400
X-MC-Unique: 1UTmIjIfNNm3_OknrNcsXw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C398C801585;
	Fri, 25 Mar 2022 23:27:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A6F4C090DA;
	Fri, 25 Mar 2022 23:27:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 706681940352;
	Fri, 25 Mar 2022 23:27:25 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C550A1940341 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Mar 2022 23:27:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A190440D2972; Fri, 25 Mar 2022 23:27:23 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D21340D2970
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 23:27:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FFF61C04B43
 for <linux-cachefs@redhat.com>; Fri, 25 Mar 2022 23:27:23 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-PhZJZlvlPBmKm8Ki9svMkA-1; Fri, 25 Mar 2022 19:27:21 -0400
X-MC-Unique: PhZJZlvlPBmKm8Ki9svMkA-1
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="321926006"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="321926006"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 16:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; d="scan'208";a="553371036"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2022 16:26:11 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nXtJq-000Mii-Nz; Fri, 25 Mar 2022 23:26:10 +0000
Date: Sat, 26 Mar 2022 07:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
 linux-erofs@lists.ozlabs.org
Message-ID: <202203260720.uA5o7k5w-lkp@intel.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: kbuild-all@lists.01.org, gregkh@linuxfoundation.org, llvm@lists.linux.dev,
 fannaihao@baidu.com, tao.peng@linux.alibaba.com, willy@infradead.org,
 linux-kernel@vger.kernel.org, tianzichen@kuaishou.com,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220326/202203260720.uA5o7k5w-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ec8aa2f84eb47244377e4b822dd77d82ee54714a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeffle-Xu/fscache-erofs-fscache-based-on-demand-read-semantics/20220325-203555
        git checkout ec8aa2f84eb47244377e4b822dd77d82ee54714a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from fs/cachefiles/cache.c:11:
>> fs/cachefiles/internal.h:285:9: warning: no previous prototype for function 'cachefiles_ondemand_daemon_read' [-Wmissing-prototypes]
   ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
           ^
   fs/cachefiles/internal.h:285:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
   ^
   static 
   1 warning generated.
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/daemon.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/interface.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/io.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/key.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/main.o:(.text+0x38C0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/namei.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/security.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/volume.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: cachefiles_ondemand_daemon_read
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/cache.o:(cachefiles_ondemand_daemon_read)
   >>> defined at internal.h:287 (fs/cachefiles/internal.h:287)
   >>> fs/cachefiles/xattr.o:(.text+0x0)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

