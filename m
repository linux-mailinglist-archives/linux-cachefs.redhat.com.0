Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F798487E21
	for <lists+linux-cachefs@lfdr.de>; Fri,  7 Jan 2022 22:21:37 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-aHZt07VMNzGXYBvNP5pbqQ-1; Fri, 07 Jan 2022 16:21:34 -0500
X-MC-Unique: aHZt07VMNzGXYBvNP5pbqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094331083F60;
	Fri,  7 Jan 2022 21:21:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F24FA22D;
	Fri,  7 Jan 2022 21:21:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 069904BB7C;
	Fri,  7 Jan 2022 21:21:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 207LLOpN028819 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 7 Jan 2022 16:21:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 592E9492D51; Fri,  7 Jan 2022 21:21:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 545FC492D4E
	for <linux-cachefs@redhat.com>; Fri,  7 Jan 2022 21:21:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 237AB380068E
	for <linux-cachefs@redhat.com>; Fri,  7 Jan 2022 21:21:24 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-343-93GSOwDTM4ylJVCyRA9xVA-1; Fri, 07 Jan 2022 16:21:20 -0500
X-MC-Unique: 93GSOwDTM4ylJVCyRA9xVA-1
X-IronPort-AV: E=McAfee;i="6200,9189,10220"; a="241759414"
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; d="scan'208";a="241759414"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Jan 2022 13:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,271,1635231600"; d="scan'208";a="471430143"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
	by orsmga003.jf.intel.com with ESMTP; 07 Jan 2022 13:21:16 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5wfj-000J3I-P6; Fri, 07 Jan 2022 21:21:15 +0000
Date: Sat, 8 Jan 2022 05:20:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>, smfrench@gmail.com
Message-ID: <202201080540.7GY9DVWv-lkp@intel.com>
References: <164149195200.2867367.8652749735914667514.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <164149195200.2867367.8652749735914667514.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, kbuild-all@lists.01.org,
	llvm@lists.linux.dev, jlayton@kernel.org, linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH 3/3] cifs: Eliminate cifs_readdata::pages
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

Hi David,

I love your patch! Yet something to improve:

[auto build test ERROR on next-20220105]
[cannot apply to cifs/for-next linus/master v5.16-rc8 v5.16-rc7 v5.16-rc6 v5.16-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/David-Howells/cifs-Use-netfslib/20220107-025845
base:    7a769a3922d81cfc74ab4d90a9cc69485f260976
config: x86_64-randconfig-r021-20220107 (https://download.01.org/0day-ci/archive/20220108/202201080540.7GY9DVWv-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ed7e6fa413c08f7992992e2282f64df2a6894f10
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review David-Howells/cifs-Use-netfslib/20220107-025845
        git checkout ed7e6fa413c08f7992992e2282f64df2a6894f10
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/cifs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> fs/cifs/file.c:2435:7: warning: variable 'len' is uninitialized when used here [-Wuninitialized]
                   if (len < max_len)
                       ^~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   fs/cifs/file.c:2385:30: note: initialize the variable 'len' to silence this warning
           unsigned int xid, wsize, len, max_len;
                                       ^
                                        = 0
   1 warning generated.
--
>> fs/cifs/cifsencrypt.c:66:24: error: no member named 'rq_npages' in 'struct smb_rqst'
           for (i = 0; i < rqst->rq_npages; i++) {
                           ~~~~  ^
>> fs/cifs/cifsencrypt.c:70:3: error: implicit declaration of function 'rqst_page_get_length' [-Werror,-Wimplicit-function-declaration]
                   rqst_page_get_length(rqst, i, &len, &offset);
                   ^
>> fs/cifs/cifsencrypt.c:72:31: error: no member named 'rq_pages' in 'struct smb_rqst'
                   kaddr = (char *) kmap(rqst->rq_pages[i]) + offset;
                                         ~~~~  ^
   fs/cifs/cifsencrypt.c:78:17: error: no member named 'rq_pages' in 'struct smb_rqst'
                           kunmap(rqst->rq_pages[i]);
                                  ~~~~  ^
   fs/cifs/cifsencrypt.c:82:16: error: no member named 'rq_pages' in 'struct smb_rqst'
                   kunmap(rqst->rq_pages[i]);
                          ~~~~  ^
   5 errors generated.
--
>> fs/cifs/smb2ops.c:4437:39: error: no member named 'rq_npages' in 'struct smb_rqst'
                   sg_len += rqst[i].rq_nvec + rqst[i].rq_npages;
                                               ~~~~~~~ ^
   fs/cifs/smb2ops.c:4456:27: error: no member named 'rq_npages' in 'struct smb_rqst'
                   for (j = 0; j < rqst[i].rq_npages; j++) {
                                   ~~~~~~~ ^
>> fs/cifs/smb2ops.c:4459:4: error: implicit declaration of function 'rqst_page_get_length' [-Werror,-Wimplicit-function-declaration]
                           rqst_page_get_length(&rqst[i], j, &len, &offset);
                           ^
>> fs/cifs/smb2ops.c:4460:36: error: no member named 'rq_pages' in 'struct smb_rqst'
                           sg_set_page(&sg[idx++], rqst[i].rq_pages[j], len, offset);
                                                   ~~~~~~~ ^
>> fs/cifs/smb2ops.c:4663:4: error: must use 'struct' tag to refer to type 'page'
                           page = alloc_page(GFP_KERNEL|__GFP_HIGHMEM);
                           ^
                           struct 
>> fs/cifs/smb2ops.c:4663:9: error: expected identifier or '('
                           page = alloc_page(GFP_KERNEL|__GFP_HIGHMEM);
                                ^
>> fs/cifs/smb2ops.c:4664:29: error: use of undeclared identifier 'page'
                           if (!xa_store(buffer, j, page, gfp))
                                                    ^
>> fs/cifs/smb2ops.c:4664:35: error: use of undeclared identifier 'gfp'
                           if (!xa_store(buffer, j, page, gfp))
                                                          ^
>> fs/cifs/smb2ops.c:4664:29: error: use of undeclared identifier 'page'
                           if (!xa_store(buffer, j, page, gfp))
                                                    ^
>> fs/cifs/smb2ops.c:4664:35: error: use of undeclared identifier 'gfp'
                           if (!xa_store(buffer, j, page, gfp))
                                                          ^
>> fs/cifs/smb2ops.c:4664:29: error: use of undeclared identifier 'page'
                           if (!xa_store(buffer, j, page, gfp))
                                                    ^
>> fs/cifs/smb2ops.c:4664:35: error: use of undeclared identifier 'gfp'
                           if (!xa_store(buffer, j, page, gfp))
                                                          ^
   fs/cifs/smb2ops.c:4668:28: error: use of undeclared identifier 'page'; did you mean 'pages'?
                           if (copy_page_from_iter(page, 0, seg, &old->rq_iter) != seg) {
                                                   ^~~~
                                                   pages
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^
   fs/cifs/smb2ops.c:4644:16: note: 'pages' declared here
           struct page **pages;
                         ^
   fs/cifs/smb2ops.c:4668:28: error: use of undeclared identifier 'page'; did you mean 'pages'?
                           if (copy_page_from_iter(page, 0, seg, &old->rq_iter) != seg) {
                                                   ^~~~
                                                   pages
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:61: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                               ^
   fs/cifs/smb2ops.c:4644:16: note: 'pages' declared here
           struct page **pages;
                         ^
   fs/cifs/smb2ops.c:4668:28: error: use of undeclared identifier 'page'; did you mean 'pages'?
                           if (copy_page_from_iter(page, 0, seg, &old->rq_iter) != seg) {
                                                   ^~~~
                                                   pages
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                                        ^
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_value'
           (cond) ?                                        \
            ^
   fs/cifs/smb2ops.c:4644:16: note: 'pages' declared here
           struct page **pages;
                         ^
   fs/cifs/smb2ops.c:4718:7: error: no member named 'rq_pages' in 'struct smb_rqst'
           rqst.rq_pages = pages;
           ~~~~ ^
   fs/cifs/smb2ops.c:4719:7: error: no member named 'rq_npages' in 'struct smb_rqst'
           rqst.rq_npages = npages;
           ~~~~ ^
>> fs/cifs/smb2ops.c:4720:7: error: no member named 'rq_pagesz' in 'struct smb_rqst'
           rqst.rq_pagesz = PAGE_SIZE;
           ~~~~ ^
>> fs/cifs/smb2ops.c:4721:7: error: no member named 'rq_tailsz' in 'struct smb_rqst'
           rqst.rq_tailsz = (page_data_size % PAGE_SIZE) ? : PAGE_SIZE;
           ~~~~ ^
   19 errors generated.


vim +66 fs/cifs/cifsencrypt.c

^1da177e4c3f41 Linus Torvalds     2005-04-16  26  
16c568efff82e4 Al Viro            2015-11-12  27  int __cifs_calc_signature(struct smb_rqst *rqst,
16c568efff82e4 Al Viro            2015-11-12  28  			struct TCP_Server_Info *server, char *signature,
16c568efff82e4 Al Viro            2015-11-12  29  			struct shash_desc *shash)
84afc29b185334 Steve French       2005-12-02  30  {
e9917a000fcc37 Steve French       2006-03-31  31  	int i;
307fbd31b61623 Shirish Pargaonkar 2010-10-21  32  	int rc;
bf5ea0e2f29b00 Jeff Layton        2012-09-18  33  	struct kvec *iov = rqst->rq_iov;
bf5ea0e2f29b00 Jeff Layton        2012-09-18  34  	int n_vec = rqst->rq_nvec;
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  35  	int is_smb2 = server->vals->header_preamble_size == 0;
84afc29b185334 Steve French       2005-12-02  36  
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  37  	/* iov[0] is actual data and not the rfc1002 length for SMB2+ */
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  38  	if (is_smb2) {
83ffdeadb46b61 Paulo Alcantara    2018-06-15  39  		if (iov[0].iov_len <= 4)
83ffdeadb46b61 Paulo Alcantara    2018-06-15  40  			return -EIO;
83ffdeadb46b61 Paulo Alcantara    2018-06-15  41  		i = 0;
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  42  	} else {
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  43  		if (n_vec < 2 || iov[0].iov_len != 4)
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  44  			return -EIO;
83ffdeadb46b61 Paulo Alcantara    2018-06-15  45  		i = 1; /* skip rfc1002 length */
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  46  	}
c713c8770fa5bf Ronnie Sahlberg    2018-06-12  47  
83ffdeadb46b61 Paulo Alcantara    2018-06-15  48  	for (; i < n_vec; i++) {
745542e210b3b1 Jeff Layton        2007-11-03  49  		if (iov[i].iov_len == 0)
745542e210b3b1 Jeff Layton        2007-11-03  50  			continue;
e9917a000fcc37 Steve French       2006-03-31  51  		if (iov[i].iov_base == NULL) {
f96637be081141 Joe Perches        2013-05-04  52  			cifs_dbg(VFS, "null iovec entry\n");
e9917a000fcc37 Steve French       2006-03-31  53  			return -EIO;
745542e210b3b1 Jeff Layton        2007-11-03  54  		}
83ffdeadb46b61 Paulo Alcantara    2018-06-15  55  
16c568efff82e4 Al Viro            2015-11-12  56  		rc = crypto_shash_update(shash,
307fbd31b61623 Shirish Pargaonkar 2010-10-21  57  					 iov[i].iov_base, iov[i].iov_len);
14cae3243b555a Shirish Pargaonkar 2011-06-20  58  		if (rc) {
f96637be081141 Joe Perches        2013-05-04  59  			cifs_dbg(VFS, "%s: Could not update with payload\n",
14cae3243b555a Shirish Pargaonkar 2011-06-20  60  				 __func__);
14cae3243b555a Shirish Pargaonkar 2011-06-20  61  			return rc;
14cae3243b555a Shirish Pargaonkar 2011-06-20  62  		}
14cae3243b555a Shirish Pargaonkar 2011-06-20  63  	}
84afc29b185334 Steve French       2005-12-02  64  
fb308a6f22f7f4 Jeff Layton        2012-09-18  65  	/* now hash over the rq_pages array */
fb308a6f22f7f4 Jeff Layton        2012-09-18 @66  	for (i = 0; i < rqst->rq_npages; i++) {
4c0d2a5a64332c Long Li            2018-05-30  67  		void *kaddr;
4c0d2a5a64332c Long Li            2018-05-30  68  		unsigned int len, offset;
16c568efff82e4 Al Viro            2015-11-12  69  
4c0d2a5a64332c Long Li            2018-05-30 @70  		rqst_page_get_length(rqst, i, &len, &offset);
4c0d2a5a64332c Long Li            2018-05-30  71  
4c0d2a5a64332c Long Li            2018-05-30 @72  		kaddr = (char *) kmap(rqst->rq_pages[i]) + offset;
16c568efff82e4 Al Viro            2015-11-12  73  
a12d0c590cc7ae Paulo Alcantara    2018-06-23  74  		rc = crypto_shash_update(shash, kaddr, len);
a12d0c590cc7ae Paulo Alcantara    2018-06-23  75  		if (rc) {
a12d0c590cc7ae Paulo Alcantara    2018-06-23  76  			cifs_dbg(VFS, "%s: Could not update with payload\n",
a12d0c590cc7ae Paulo Alcantara    2018-06-23  77  				 __func__);
a12d0c590cc7ae Paulo Alcantara    2018-06-23  78  			kunmap(rqst->rq_pages[i]);
a12d0c590cc7ae Paulo Alcantara    2018-06-23  79  			return rc;
a12d0c590cc7ae Paulo Alcantara    2018-06-23  80  		}
fb308a6f22f7f4 Jeff Layton        2012-09-18  81  
fb308a6f22f7f4 Jeff Layton        2012-09-18  82  		kunmap(rqst->rq_pages[i]);
fb308a6f22f7f4 Jeff Layton        2012-09-18  83  	}
fb308a6f22f7f4 Jeff Layton        2012-09-18  84  
16c568efff82e4 Al Viro            2015-11-12  85  	rc = crypto_shash_final(shash, signature);
14cae3243b555a Shirish Pargaonkar 2011-06-20  86  	if (rc)
16c568efff82e4 Al Viro            2015-11-12  87  		cifs_dbg(VFS, "%s: Could not generate hash\n", __func__);
84afc29b185334 Steve French       2005-12-02  88  
307fbd31b61623 Shirish Pargaonkar 2010-10-21  89  	return rc;
84afc29b185334 Steve French       2005-12-02  90  }
84afc29b185334 Steve French       2005-12-02  91  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

