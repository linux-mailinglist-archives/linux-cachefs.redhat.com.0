Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2873A35A8EE
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Apr 2021 00:48:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-p4DJrMX_MiWOxzB0UKT-BQ-1; Fri, 09 Apr 2021 18:48:19 -0400
X-MC-Unique: p4DJrMX_MiWOxzB0UKT-BQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B3E510054F6;
	Fri,  9 Apr 2021 22:48:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C03EA2DAD0;
	Fri,  9 Apr 2021 22:48:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECCCC1806D0E;
	Fri,  9 Apr 2021 22:48:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139MleJm006063 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 18:47:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B51EC107272; Fri,  9 Apr 2021 22:47:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC47C107276
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 22:47:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39770802816
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 22:47:36 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-493-kG9C9-Q4PbKeBNrsiFO7-w-1; Fri, 09 Apr 2021 18:47:33 -0400
X-MC-Unique: kG9C9-Q4PbKeBNrsiFO7-w-1
IronPort-SDR: VYQEMSBaG0bnDPQdAlwiHJOUzk9MDeXIwvajen2owYBGKiER1rLEI3kQ1VQibavJW04Vt9UUdG
	3yCWJy4Dlakw==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="193890779"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
	d="gz'50?scan'50,208,50";a="193890779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Apr 2021 15:46:28 -0700
IronPort-SDR: jMMyuOUxZkxi+Lp0tbBDLsWzOoYPkzrfZNShTKEpePUBDj/MLmZTbVntq/NYhzSiLZJl1FmZ1q
	0zEzN/9a2vKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
	d="gz'50?scan'50,208,50";a="613871958"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
	by fmsmga005.fm.intel.com with ESMTP; 09 Apr 2021 15:46:25 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1lUztR-000HRm-3O; Fri, 09 Apr 2021 22:46:25 +0000
Date: Sat, 10 Apr 2021 06:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org
Message-ID: <202104100656.N7EVvkNZ-lkp@intel.com>
References: <20210409185105.188284-3-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210409185105.188284-3-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: kbuild-all@lists.01.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	clang-built-linux@googlegroups.com, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v7 02/28] mm: Introduce struct folio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi "Matthew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20210409]
[also build test ERROR on v5.12-rc6]
[cannot apply to linux/master linus/master hnaz-linux-mm/master v5.12-rc6 v5.12-rc5 v5.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Matthew-Wilcox-Oracle/Memory-Folios/20210410-031353
base:    e99d8a8495175df8cb8b739f8cf9b0fc9d0cd3b5
config: powerpc-randconfig-r032-20210409 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project dd453a1389b6a7e6d9214b449d3c54981b1a89b6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/0day-ci/linux/commit/5658a201516d2ed74a34c328e3b55f552d4861d8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Memory-Folios/20210410-031353
        git checkout 5658a201516d2ed74a34c328e3b55f552d4861d8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=powerpc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:274:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, lru) == __builtin_offsetof(struct folio, lru)' "offsetof(struct page, lru) == offsetof(struct folio, lru)"
   FOLIO_MATCH(lru, lru);
   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:275:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, compound_head) == __builtin_offsetof(struct folio, lru)' "offsetof(struct page, compound_head) == offsetof(struct folio, lru)"
   FOLIO_MATCH(compound_head, lru);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:276:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, index) == __builtin_offsetof(struct folio, index)' "offsetof(struct page, index) == offsetof(struct folio, index)"
   FOLIO_MATCH(index, index);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:277:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, private) == __builtin_offsetof(struct folio, private)' "offsetof(struct page, private) == offsetof(struct folio, private)"
   FOLIO_MATCH(private, private);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:278:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, _mapcount) == __builtin_offsetof(struct folio, _mapcount)' "offsetof(struct page, _mapcount) == offsetof(struct folio, _mapcount)"
   FOLIO_MATCH(_mapcount, _mapcount);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:279:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, _refcount) == __builtin_offsetof(struct folio, _refcount)' "offsetof(struct page, _refcount) == offsetof(struct folio, _refcount)"
   FOLIO_MATCH(_refcount, _refcount);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:281:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, memcg_data) == __builtin_offsetof(struct folio, memcg_data)' "offsetof(struct page, memcg_data) == offsetof(struct folio, memcg_data)"
   FOLIO_MATCH(memcg_data, memcg_data);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:21:
   include/linux/mman.h:155:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:133:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:156:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:133:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 7 errors generated.
--
   error: no override and no default toolchain set
   init/Kconfig:70:warning: 'RUSTC_VERSION': number is invalid
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:274:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, lru) == __builtin_offsetof(struct folio, lru)' "offsetof(struct page, lru) == offsetof(struct folio, lru)"
   FOLIO_MATCH(lru, lru);
   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:275:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, compound_head) == __builtin_offsetof(struct folio, lru)' "offsetof(struct page, compound_head) == offsetof(struct folio, lru)"
   FOLIO_MATCH(compound_head, lru);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:276:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, index) == __builtin_offsetof(struct folio, index)' "offsetof(struct page, index) == offsetof(struct folio, index)"
   FOLIO_MATCH(index, index);
   ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:277:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, private) == __builtin_offsetof(struct folio, private)' "offsetof(struct page, private) == offsetof(struct folio, private)"
   FOLIO_MATCH(private, private);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:278:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, _mapcount) == __builtin_offsetof(struct folio, _mapcount)' "offsetof(struct page, _mapcount) == offsetof(struct folio, _mapcount)"
   FOLIO_MATCH(_mapcount, _mapcount);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:279:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, _refcount) == __builtin_offsetof(struct folio, _refcount)' "offsetof(struct page, _refcount) == offsetof(struct folio, _refcount)"
   FOLIO_MATCH(_refcount, _refcount);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:14:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:15:
   In file included from include/linux/radix-tree.h:19:
   In file included from include/linux/xarray.h:14:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:21:
>> include/linux/mm_types.h:281:1: error: static_assert failed due to requirement '__builtin_offsetof(struct page, memcg_data) == __builtin_offsetof(struct folio, memcg_data)' "offsetof(struct page, memcg_data) == offsetof(struct folio, memcg_data)"
   FOLIO_MATCH(memcg_data, memcg_data);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/powerpc/kernel/asm-offsets.c:21:
   include/linux/mman.h:155:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_LOCKED,     VM_LOCKED    ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:133:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   include/linux/mman.h:156:9: warning: division by zero is undefined [-Wdivision-by-zero]
                  _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:133:21: note: expanded from macro '_calc_vm_trans'
      : ((x) & (bit1)) / ((bit1) / (bit2))))
                       ^ ~~~~~~~~~~~~~~~~~
   2 warnings and 7 errors generated.
   make[2]: *** [scripts/Makefile.build:118: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1304: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +274 include/linux/mm_types.h

   269	
   270	static_assert(sizeof(struct page) == sizeof(struct folio));
   271	#define FOLIO_MATCH(pg, fl)						\
   272		static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
   273	FOLIO_MATCH(flags, flags);
 > 274	FOLIO_MATCH(lru, lru);
 > 275	FOLIO_MATCH(compound_head, lru);
 > 276	FOLIO_MATCH(index, index);
 > 277	FOLIO_MATCH(private, private);
 > 278	FOLIO_MATCH(_mapcount, _mapcount);
 > 279	FOLIO_MATCH(_refcount, _refcount);
   280	#ifdef CONFIG_MEMCG
 > 281	FOLIO_MATCH(memcg_data, memcg_data);
   282	#endif
   283	#undef FOLIO_MATCH
   284	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--fUYQa+Pmc3FrFX/N
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
7Dl2oszINL6mrXfu/z9p++e5iJMCAA==
--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--fUYQa+Pmc3FrFX/N--

