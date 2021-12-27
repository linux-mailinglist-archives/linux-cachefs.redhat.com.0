Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AA47FEC8
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 16:33:50 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-R2VJ_bgjOUuNzHj-_xFy6g-1; Mon, 27 Dec 2021 10:33:46 -0500
X-MC-Unique: R2VJ_bgjOUuNzHj-_xFy6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 847CA801A02;
	Mon, 27 Dec 2021 15:33:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 425587B6D8;
	Mon, 27 Dec 2021 15:33:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38AFD1809CB8;
	Mon, 27 Dec 2021 15:33:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRFXZOn013879 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 10:33:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9BFC54010E9C; Mon, 27 Dec 2021 15:33:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96E9940CFD07
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 15:33:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7DCC185A5B5
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 15:33:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-132--AbaNNe4PLSwQ2a_1JAWqA-1; Mon, 27 Dec 2021 10:33:34 -0500
X-MC-Unique: -AbaNNe4PLSwQ2a_1JAWqA-1
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="238761568"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="238761568"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Dec 2021 07:32:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="618475900"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
	by orsmga004.jf.intel.com with ESMTP; 27 Dec 2021 07:32:27 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1rz8-0006UP-SR; Mon, 27 Dec 2021 15:32:26 +0000
Date: Mon, 27 Dec 2021 23:32:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
	linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
	linux-erofs@lists.ozlabs.org
Message-ID: <202112272340.1ho7sEjG-lkp@intel.com>
References: <20211227125444.21187-20-jefflexu@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <20211227125444.21187-20-jefflexu@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: linux-cachefs@redhat.com
Cc: kbuild-all@lists.01.org, tao.peng@linux.alibaba.com,
	joseph.qi@linux.alibaba.com, bo.liu@linux.alibaba.com,
	linux-fsdevel@vger.kernel.org, gerry@linux.alibaba.com
Subject: Re: [Linux-cachefs] [PATCH v1 19/23] cachefiles: implement
 .demand_read() for demand read
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jeffle,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on dhowells-fs/fscache-next]
[cannot apply to xiang-erofs/dev-test ceph-client/for-linus linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jeffle-Xu/fscache-erofs-fscache-based-demand-read-semantics/20211227-205742
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git fscache-next
config: csky-defconfig (https://download.01.org/0day-ci/archive/20211227/202112272340.1ho7sEjG-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/54c300b4598e3f2836d8233681da387fe388cfda
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeffle-Xu/fscache-erofs-fscache-based-demand-read-semantics/20211227-205742
        git checkout 54c300b4598e3f2836d8233681da387fe388cfda
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=csky SHELL=/bin/bash fs/cachefiles/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/cachefiles/io.c:564:5: warning: no previous prototype for 'cachefiles_demand_read' [-Wmissing-prototypes]
     564 | int cachefiles_demand_read(struct netfs_cache_resources *cres,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In function 'cachefiles_alloc_req',
       inlined from 'cachefiles_demand_read' at fs/cachefiles/io.c:575:8:
>> fs/cachefiles/io.c:557:9: warning: 'strncpy' specified bound 255 equals destination size [-Wstringop-truncation]
     557 |         strncpy(req_in->path, object->d_name, sizeof(req_in->path));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/strncpy +557 fs/cachefiles/io.c

   541	
   542	static struct cachefiles_req *cachefiles_alloc_req(struct cachefiles_object *object,
   543							   loff_t start_pos,
   544							   size_t len)
   545	{
   546		struct cachefiles_req *req;
   547		struct cachefiles_req_in *req_in;
   548	
   549		req = kzalloc(sizeof(*req), GFP_KERNEL);
   550		if (!req)
   551			return NULL;
   552	
   553		req_in = &req->req_in;
   554	
   555		req_in->off = start_pos;
   556		req_in->len = len;
 > 557		strncpy(req_in->path, object->d_name, sizeof(req_in->path));
   558	
   559		init_completion(&req->done);
   560	
   561		return req;
   562	}
   563	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

