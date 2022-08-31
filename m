Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D64105A73F2
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Aug 2022 04:37:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661913427;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wg4bANEvNUc1RhZSOjF7Iw+2SgBztj+xrCbHT8MgzDs=;
	b=PfoOXJ6J3NmTtRSF9Wh3wtN/JDiB2F3qW3UV1BNkNS2N7+aAj0Qro5XuZwdtPazmGW7Ml1
	8zkdc5slgqdYrmD1xh84BLypj/WbC303gR6MYXXJPrsA7afguLSzdFks7zszRJOZ1GoVaN
	smLsspEu/8dSmJh7XUzJg71e2HQaHmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-VppH20l4ODy5LLvs3LIM4g-1; Tue, 30 Aug 2022 22:37:04 -0400
X-MC-Unique: VppH20l4ODy5LLvs3LIM4g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6A18185A7B2;
	Wed, 31 Aug 2022 02:37:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 84BB2492C3B;
	Wed, 31 Aug 2022 02:37:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A8241946A48;
	Wed, 31 Aug 2022 02:37:03 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F4051946A40 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 31 Aug 2022 02:37:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21D4440315A; Wed, 31 Aug 2022 02:37:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E064492C3B
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 02:37:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04B5B3804502
 for <linux-cachefs@redhat.com>; Wed, 31 Aug 2022 02:37:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-N5_MYkWNPY-RtS2pfR2mEw-1; Tue, 30 Aug 2022 22:37:00 -0400
X-MC-Unique: N5_MYkWNPY-RtS2pfR2mEw-1
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="292932218"
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="292932218"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 19:35:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,276,1654585200"; d="scan'208";a="562891345"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 19:35:48 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oTDa0-0000tn-0I;
 Wed, 31 Aug 2022 02:35:48 +0000
Date: Wed, 31 Aug 2022 10:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Wysochanski <dwysocha@redhat.com>,
 Anna Schumaker <anna.schumaker@netapp.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 David Howells <dhowells@redhat.com>
Message-ID: <202208311054.eXBCcm1y-lkp@intel.com>
References: <20220831005053.1287363-4-dwysocha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220831005053.1287363-4-dwysocha@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v3 3/3] NFS: Convert buffered read paths
 to use netfs when fscache is enabled
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
Cc: Benjamin Maynard <benmaynard@google.com>, linux-nfs@vger.kernel.org,
 linux-cachefs@redhat.com, kbuild-all@lists.01.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on v6.0-rc3]
[also build test WARNING on linus/master next-20220830]
[cannot apply to trondmy-nfs/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Wysochanski/Convert-NFS-with-fscache-to-the-netfs-API/20220831-085217
base:    b90cb1053190353cc30f0fef0ef1f378ccc063c5
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220831/202208311054.eXBCcm1y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5ac59d0573d1008c9d8856a91e4b4fd2ee61bb63
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dave-Wysochanski/Convert-NFS-with-fscache-to-the-netfs-API/20220831-085217
        git checkout 5ac59d0573d1008c9d8856a91e4b4fd2ee61bb63
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   fs/nfs/fscache.c: In function 'nfs_netfs_read_initiate':
>> fs/nfs/fscache.c:331:42: warning: variable 'sreq' set but not used [-Wunused-but-set-variable]
     331 |         struct netfs_io_subrequest      *sreq;
         |                                          ^~~~
   fs/nfs/fscache.c: In function 'nfs_netfs_read_done':
   fs/nfs/fscache.c:346:42: warning: variable 'sreq' set but not used [-Wunused-but-set-variable]
     346 |         struct netfs_io_subrequest      *sreq;
         |                                          ^~~~


vim +/sreq +331 fs/nfs/fscache.c

   327	
   328	void nfs_netfs_read_initiate(struct nfs_pgio_header *hdr)
   329	{
   330		struct nfs_netfs_io_data        *netfs = hdr->netfs;
 > 331		struct netfs_io_subrequest      *sreq;
   332	
   333		if (!netfs)
   334			return;
   335	
   336		sreq = netfs->sreq;
   337		spin_lock(&netfs->lock);
   338		atomic_inc(&netfs->rpcs);
   339		netfs->rpc_byte_count += hdr->args.count;
   340		spin_unlock(&netfs->lock);
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

