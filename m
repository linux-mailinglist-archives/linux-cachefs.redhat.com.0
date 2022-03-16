Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 705CA4DB8F4
	for <lists+linux-cachefs@lfdr.de>; Wed, 16 Mar 2022 20:38:49 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-yvGVoFo6PyK5qcBNA5RuuA-1; Wed, 16 Mar 2022 15:38:45 -0400
X-MC-Unique: yvGVoFo6PyK5qcBNA5RuuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C0408002BF;
	Wed, 16 Mar 2022 19:38:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B58D92156A5A;
	Wed, 16 Mar 2022 19:38:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 81919194034E;
	Wed, 16 Mar 2022 19:38:42 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7C6B41949761 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 16 Mar 2022 19:38:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42B80C08095; Wed, 16 Mar 2022 19:38:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ED68C08092
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 19:38:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25FED3804073
 for <linux-cachefs@redhat.com>; Wed, 16 Mar 2022 19:38:40 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-XQNYUOuMMIGC6n_z5wcCWA-1; Wed, 16 Mar 2022 15:38:38 -0400
X-MC-Unique: XQNYUOuMMIGC6n_z5wcCWA-1
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="254255832"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="254255832"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 12:37:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="513158149"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 16 Mar 2022 12:37:28 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nUZSa-000CoG-0a; Wed, 16 Mar 2022 19:37:28 +0000
Date: Thu, 17 Mar 2022 03:37:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
 linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
 linux-erofs@lists.ozlabs.org
Message-ID: <202203170323.idYrKxCZ-lkp@intel.com>
References: <20220316131723.111553-5-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20220316131723.111553-5-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v5 04/22] cachefiles: notify user daemon
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
Cc: kbuild-all@lists.01.org, gregkh@linuxfoundation.org,
 tao.peng@linux.alibaba.com, willy@infradead.org, linux-kernel@vger.kernel.org,
 joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
 linux-fsdevel@vger.kernel.org, luodaowen.backend@bytedance.com,
 eguan@linux.alibaba.com, gerry@linux.alibaba.com,
 torvalds@linux-foundation.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
[also build test ERROR on rostedt-trace/for-next linus/master v5.17-rc8]
[cannot apply to xiang-erofs/dev-test dhowells-fs/fscache-next next-20220316]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeffle-Xu/fscache-erofs-fscache-based-on-demand-read-semantics/20220316-214711
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
config: ia64-randconfig-r033-20220317 (https://download.01.org/0day-ci/archive/20220317/202203170323.idYrKxCZ-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ef29cbdc09ec1e6ab918eaf5a16fa7ba8d23fb54
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeffle-Xu/fscache-erofs-fscache-based-on-demand-read-semantics/20220316-214711
        git checkout ef29cbdc09ec1e6ab918eaf5a16fa7ba8d23fb54
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash fs/cachefiles/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/ia64/include/asm/pgtable.h:153,
                    from include/linux/pgtable.h:6,
                    from arch/ia64/include/asm/uaccess.h:40,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from fs/cachefiles/daemon.c:13:
   arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
   arch/ia64/include/asm/mmu_context.h:127:48: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
     127 |         unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
         |                                                ^~~~~~~
   fs/cachefiles/daemon.c: In function 'cachefiles_ondemand_fd_write_iter':
>> fs/cachefiles/daemon.c:160:26: error: invalid use of undefined type 'struct iov_iter'
     160 |         size_t len = iter->count;
         |                          ^~


vim +160 fs/cachefiles/daemon.c

   153	
   154	static ssize_t cachefiles_ondemand_fd_write_iter(struct kiocb *kiocb,
   155							 struct iov_iter *iter)
   156	{
   157		struct cachefiles_object *object = kiocb->ki_filp->private_data;
   158		struct cachefiles_cache *cache = object->volume->cache;
   159		struct file *file = object->file;
 > 160		size_t len = iter->count;
   161		loff_t pos = kiocb->ki_pos;
   162		const struct cred *saved_cred;
   163		int ret;
   164	
   165		if (!file)
   166			return -ENOBUFS;
   167	
   168		cachefiles_begin_secure(cache, &saved_cred);
   169		ret = __cachefiles_prepare_write(object, file, &pos, &len, true);
   170		cachefiles_end_secure(cache, saved_cred);
   171		if (ret < 0)
   172			return ret;
   173	
   174		ret = __cachefiles_write(object, file, pos, iter, NULL, NULL);
   175		if (!ret)
   176			ret = len;
   177	
   178		return ret;
   179	}
   180	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

