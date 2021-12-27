Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D54802AF
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 18:20:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-bNWVCt3uNbyHHXnOmSB-ig-1; Mon, 27 Dec 2021 12:20:18 -0500
X-MC-Unique: bNWVCt3uNbyHHXnOmSB-ig-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DDA51006AA5;
	Mon, 27 Dec 2021 17:20:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01FB57A3F6;
	Mon, 27 Dec 2021 17:20:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 863B51809CB8;
	Mon, 27 Dec 2021 17:20:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRHKD2m020697 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 12:20:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B1C32026D6A; Mon, 27 Dec 2021 17:20:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D762026D46
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 17:20:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0C70803DDA
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 17:20:07 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-357-yb4tDky0P5CPS_Sq_wKaaw-1; Mon, 27 Dec 2021 12:20:06 -0500
X-MC-Unique: yb4tDky0P5CPS_Sq_wKaaw-1
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="221241906"
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; d="scan'208";a="221241906"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Dec 2021 09:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,240,1635231600"; d="scan'208";a="686343731"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
	by orsmga005.jf.intel.com with ESMTP; 27 Dec 2021 09:18:31 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1tdm-0006dR-Np; Mon, 27 Dec 2021 17:18:30 +0000
Date: Tue, 28 Dec 2021 01:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
	linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
	linux-erofs@lists.ozlabs.org
Message-ID: <202112280132.0kJ8Vjql-lkp@intel.com>
References: <20211227125444.21187-13-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20211227125444.21187-13-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: kbuild-all@lists.01.org, tao.peng@linux.alibaba.com,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, gerry@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 12/23] erofs: implement fscache-based
	metadata read
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jeffle,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on dhowells-fs/fscache-next]
[cannot apply to xiang-erofs/dev-test ceph-client/for-linus linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeffle-Xu/fscache-erofs-fscache-based-demand-read-semantics/20211227-205742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git fscache-next
config: x86_64-randconfig-a014-20211227 (https://download.01.org/0day-ci/archive/20211228/202112280132.0kJ8Vjql-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/c3453b91df3b4e89c3336453437f761d6cb6bca3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeffle-Xu/fscache-erofs-fscache-based-demand-read-semantics/20211227-205742
        git checkout c3453b91df3b4e89c3336453437f761d6cb6bca3
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_machine_check()+0x89f: call to queue_task_work() leaves .noinstr.text section
   vmlinux.o: warning: objtool: enter_from_user_mode()+0x4e: call to on_thread_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode()+0x59: call to on_thread_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare()+0x4e: call to on_thread_stack() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode()+0x4e: call to on_thread_stack() leaves .noinstr.text section
   ld: fs/erofs/fscache.o: in function `erofs_issue_op':
   fs/erofs/fscache.c:27: undefined reference to `netfs_subreq_terminated'
   ld: fs/erofs/fscache.o: in function `erofs_readpage_from_fscache':
>> fs/erofs/fscache.c:59: undefined reference to `netfs_readpage'


vim +59 fs/erofs/fscache.c

    35	
    36	struct page *erofs_readpage_from_fscache(struct erofs_cookie_ctx *ctx,
    37						 pgoff_t index)
    38	{
    39		struct folio *folio;
    40		struct page *page;
    41		struct super_block *sb = ctx->inode->i_sb;
    42		int ret;
    43	
    44		page = find_or_create_page(ctx->inode->i_mapping, index, GFP_KERNEL);
    45		if (unlikely(!page)) {
    46			erofs_err(sb, "failed to allocate page");
    47			return ERR_PTR(-ENOMEM);
    48		}
    49	
    50		/* The content is already buffered in the address space */
    51		if (PageUptodate(page)) {
    52			unlock_page(page);
    53			return page;
    54		}
    55	
    56		/* Or a new page cache is created, then read the content from fscache */
    57		folio = page_folio(page);
    58	
  > 59		ret = netfs_readpage(NULL, folio, &erofs_req_ops, ctx->cookie);
    60		if (unlikely(ret || !PageUptodate(page))) {
    61			erofs_err(sb, "failed to read from fscache");
    62			return ERR_PTR(-EINVAL);
    63		}
    64	
    65		return page;
    66	}
    67	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

