Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 82312480140
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Dec 2021 16:56:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-vpYX_qJxMYOwpzpCx7bEkA-1; Mon, 27 Dec 2021 10:56:43 -0500
X-MC-Unique: vpYX_qJxMYOwpzpCx7bEkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB2971023F4F;
	Mon, 27 Dec 2021 15:56:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A4292BE74;
	Mon, 27 Dec 2021 15:56:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2DB74BB7C;
	Mon, 27 Dec 2021 15:56:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BRFucS4014885 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Dec 2021 10:56:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 409D41121321; Mon, 27 Dec 2021 15:56:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D3891121320
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 15:56:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45D381C1CD42
	for <linux-cachefs@redhat.com>; Mon, 27 Dec 2021 15:56:35 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-552-glkUZkllOvu9Rqc9CR8W5w-1; Mon, 27 Dec 2021 10:56:33 -0500
X-MC-Unique: glkUZkllOvu9Rqc9CR8W5w-1
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="238765817"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="238765817"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Dec 2021 07:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; d="scan'208";a="686318910"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
	by orsmga005.jf.intel.com with ESMTP; 27 Dec 2021 07:56:28 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1sMO-0006XQ-Bx; Mon, 27 Dec 2021 15:56:28 +0000
Date: Mon, 27 Dec 2021 23:55:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffle Xu <jefflexu@linux.alibaba.com>, dhowells@redhat.com,
	linux-cachefs@redhat.com, xiang@kernel.org, chao@kernel.org,
	linux-erofs@lists.ozlabs.org
Message-ID: <202112272353.ekKESQX6-lkp@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev, tao.peng@linux.alibaba.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
config: i386-randconfig-r005-20211227 (https://download.01.org/0day-ci/archive/20211227/202112272353.ekKESQX6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/54c300b4598e3f2836d8233681da387fe388cfda
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jeffle-Xu/fscache-erofs-fscache-based-demand-read-semantics/20211227-205742
        git checkout 54c300b4598e3f2836d8233681da387fe388cfda
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/cachefiles/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/cachefiles/io.c:564:5: warning: no previous prototype for function 'cachefiles_demand_read' [-Wmissing-prototypes]
   int cachefiles_demand_read(struct netfs_cache_resources *cres,
       ^
   fs/cachefiles/io.c:564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int cachefiles_demand_read(struct netfs_cache_resources *cres,
   ^
   static 
   1 warning generated.


vim +/cachefiles_demand_read +564 fs/cachefiles/io.c

   563	
 > 564	int cachefiles_demand_read(struct netfs_cache_resources *cres,
   565				   loff_t start_pos, size_t len)
   566	{
   567		struct cachefiles_object *object;
   568		struct cachefiles_cache *cache;
   569		struct cachefiles_req *req;
   570		int ret;
   571	
   572		object = cachefiles_cres_object(cres);
   573		cache = object->volume->cache;
   574	
   575		req = cachefiles_alloc_req(object, start_pos, len);
   576		if (!req)
   577			return -ENOMEM;
   578	
   579		spin_lock(&cache->reqs_lock);
   580		ret = idr_alloc(&cache->reqs, req, 0, 0, GFP_KERNEL);
   581		if (ret >= 0)
   582			req->req_in.id = ret;
   583		spin_unlock(&cache->reqs_lock);
   584		if (ret < 0) {
   585			kfree(req);
   586			return -ENOMEM;
   587		}
   588	
   589		wake_up_all(&cache->daemon_pollwq);
   590	
   591		wait_for_completion(&req->done);
   592		kfree(req);
   593	
   594		return 0;
   595	}
   596	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

