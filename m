Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 85A9A35AA62
	for <lists+linux-cachefs@lfdr.de>; Sat, 10 Apr 2021 04:53:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-yd9lpE34P7qXN2rNWsGV0A-1; Fri, 09 Apr 2021 22:52:56 -0400
X-MC-Unique: yd9lpE34P7qXN2rNWsGV0A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A13C1006706;
	Sat, 10 Apr 2021 02:52:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 694435D6AD;
	Sat, 10 Apr 2021 02:52:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 762355534C;
	Sat, 10 Apr 2021 02:52:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13A2qiek024630 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 22:52:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC03210AF435; Sat, 10 Apr 2021 02:52:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B62AE10AF424
	for <linux-cachefs@redhat.com>; Sat, 10 Apr 2021 02:52:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65738811E7A
	for <linux-cachefs@redhat.com>; Sat, 10 Apr 2021 02:52:42 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-138-11KONPkhMletVcrP6dHaTg-1;
	Fri, 09 Apr 2021 22:52:39 -0400
X-MC-Unique: 11KONPkhMletVcrP6dHaTg-1
IronPort-SDR: FcYsSJmqp3zSoGb5f4mDXWQO81hmUKiCZNE4H+67PqYbqW3m9PbDBR226xk5SEsaXaS144DA1B
	00XxvUZcWRWg==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="279156706"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
	d="gz'50?scan'50,208,50";a="279156706"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Apr 2021 19:52:37 -0700
IronPort-SDR: cSw4XffCXRgeTZx/XfCv7u+o2QnNgqZA+cPAJvppDOBrcvWuj+Zy7Jjuc3V3dRgmuBq5txfW+H
	1jenTVyKHVUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; 
	d="gz'50?scan'50,208,50";a="520488211"
Received: from lkp-server01.sh.intel.com (HELO 69d8fcc516b7) ([10.239.97.150])
	by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2021 19:52:35 -0700
Received: from kbuild by 69d8fcc516b7 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1lV3je-000HjI-GT; Sat, 10 Apr 2021 02:52:34 +0000
Date: Sat, 10 Apr 2021 10:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, linux-mm@kvack.org
Message-ID: <202104101038.1fji2pdh-lkp@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: kbuild-all@lists.01.org, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	linux-afs@lists.infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="x+6KMIRAuhnl3hBn"
Content-Disposition: inline

--x+6KMIRAuhnl3hBn
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
config: mips-gpr_defconfig (attached as .config)
compiler: mipsel-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/5658a201516d2ed74a34c328e3b55f552d4861d8
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Memory-Folios/20210410-031353
        git checkout 5658a201516d2ed74a34c328e3b55f552d4861d8
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=mips 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:53,
                    from arch/mips/include/asm/div64.h:12,
                    from include/linux/math64.h:7,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, lru) == offsetof(struct folio, lru)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:274:1: note: in expansion of macro 'FOLIO_MATCH'
     274 | FOLIO_MATCH(lru, lru);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, compound_head) == offsetof(struct folio, lru)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:275:1: note: in expansion of macro 'FOLIO_MATCH'
     275 | FOLIO_MATCH(compound_head, lru);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, index) == offsetof(struct folio, index)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:276:1: note: in expansion of macro 'FOLIO_MATCH'
     276 | FOLIO_MATCH(index, index);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, private) == offsetof(struct folio, private)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:277:1: note: in expansion of macro 'FOLIO_MATCH'
     277 | FOLIO_MATCH(private, private);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, _mapcount) == offsetof(struct folio, _mapcount)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:278:1: note: in expansion of macro 'FOLIO_MATCH'
     278 | FOLIO_MATCH(_mapcount, _mapcount);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, _refcount) == offsetof(struct folio, _refcount)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:279:1: note: in expansion of macro 'FOLIO_MATCH'
     279 | FOLIO_MATCH(_refcount, _refcount);
         | ^~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      93 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
     109 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:137:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     137 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     180 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:219:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     219 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     254 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:347:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     347 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:53,
                    from arch/mips/include/asm/div64.h:12,
                    from include/linux/math64.h:7,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, lru) == offsetof(struct folio, lru)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:274:1: note: in expansion of macro 'FOLIO_MATCH'
     274 | FOLIO_MATCH(lru, lru);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, compound_head) == offsetof(struct folio, lru)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:275:1: note: in expansion of macro 'FOLIO_MATCH'
     275 | FOLIO_MATCH(compound_head, lru);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, index) == offsetof(struct folio, index)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:276:1: note: in expansion of macro 'FOLIO_MATCH'
     276 | FOLIO_MATCH(index, index);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, private) == offsetof(struct folio, private)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:277:1: note: in expansion of macro 'FOLIO_MATCH'
     277 | FOLIO_MATCH(private, private);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, _mapcount) == offsetof(struct folio, _mapcount)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:278:1: note: in expansion of macro 'FOLIO_MATCH'
     278 | FOLIO_MATCH(_mapcount, _mapcount);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, _refcount) == offsetof(struct folio, _refcount)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:279:1: note: in expansion of macro 'FOLIO_MATCH'
     279 | FOLIO_MATCH(_refcount, _refcount);
         | ^~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      93 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
     109 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:137:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     137 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     180 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:219:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     219 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     254 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:347:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     347 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:118: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1304: prepare0] Error 2
   make[1]: Target 'modules_prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'modules_prepare' not remade because of errors.
--
   error: no override and no default toolchain set
   init/Kconfig:70:warning: 'RUSTC_VERSION': number is invalid
   In file included from include/linux/bits.h:22,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:53,
                    from arch/mips/include/asm/div64.h:12,
                    from include/linux/math64.h:7,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:12:
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, lru) == offsetof(struct folio, lru)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:274:1: note: in expansion of macro 'FOLIO_MATCH'
     274 | FOLIO_MATCH(lru, lru);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, compound_head) == offsetof(struct folio, lru)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:275:1: note: in expansion of macro 'FOLIO_MATCH'
     275 | FOLIO_MATCH(compound_head, lru);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, index) == offsetof(struct folio, index)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:276:1: note: in expansion of macro 'FOLIO_MATCH'
     276 | FOLIO_MATCH(index, index);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, private) == offsetof(struct folio, private)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:277:1: note: in expansion of macro 'FOLIO_MATCH'
     277 | FOLIO_MATCH(private, private);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, _mapcount) == offsetof(struct folio, _mapcount)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:278:1: note: in expansion of macro 'FOLIO_MATCH'
     278 | FOLIO_MATCH(_mapcount, _mapcount);
         | ^~~~~~~~~~~
>> include/linux/build_bug.h:78:41: error: static assertion failed: "offsetof(struct page, _refcount) == offsetof(struct folio, _refcount)"
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/linux/mm_types.h:272:2: note: in expansion of macro 'static_assert'
     272 |  static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
         |  ^~~~~~~~~~~~~
   include/linux/mm_types.h:279:1: note: in expansion of macro 'FOLIO_MATCH'
     279 | FOLIO_MATCH(_refcount, _refcount);
         | ^~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:26:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      26 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:78:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      78 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:93:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      93 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:109:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
     109 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:137:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     137 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:180:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     180 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:219:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     219 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:254:6: warning: no previous prototype for 'output_signal_defined' [-Wmissing-prototypes]
     254 | void output_signal_defined(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/mips/kernel/asm-offsets.c:347:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     347 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:118: arch/mips/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1304: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +78 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  60  
6bab69c65013be Rasmus Villemoes 2019-03-07  61  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  62   * static_assert - check integer constant expression at build time
6bab69c65013be Rasmus Villemoes 2019-03-07  63   *
6bab69c65013be Rasmus Villemoes 2019-03-07  64   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  65   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  67   *
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  69   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  72   *
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  74   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  76   */
6bab69c65013be Rasmus Villemoes 2019-03-07 @77  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @78  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  79  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--x+6KMIRAuhnl3hBn
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
kLX2TQeuRTtx+P8ASq99AY1qAQA=
--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--x+6KMIRAuhnl3hBn--

