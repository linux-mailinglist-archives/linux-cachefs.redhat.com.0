Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 102A51BB01A
	for <lists+linux-cachefs@lfdr.de>; Mon, 27 Apr 2020 23:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588022268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XGM1HcYvBPyIts7XD2J5SzUols8ssnM8i1VWAASoVrU=;
	b=YMs8rHIW4rzAMRZKzKJmZbqtfBfbQ9BxQwxS0O42zKpdzmfGVn9qsha/80KkgvdpbwBh/A
	ETK14AuIP2661AbOZEIiJ7235Yqru+oQ+I78JlsB0cxNI0izMb+A2jRqlYvv1VIGyCCbiN
	to3hua5iGFsA/xwGI5UCqkkEZizmAhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-r3Jvi5t-PAWY2USXWKHJIQ-1; Mon, 27 Apr 2020 17:17:46 -0400
X-MC-Unique: r3Jvi5t-PAWY2USXWKHJIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0659D468;
	Mon, 27 Apr 2020 21:17:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1FDF1001920;
	Mon, 27 Apr 2020 21:17:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3542180954D;
	Mon, 27 Apr 2020 21:17:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03RLHf6k026072 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 17:17:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E249E2026FFE; Mon, 27 Apr 2020 21:17:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDC8B2026D69
	for <linux-cachefs@redhat.com>; Mon, 27 Apr 2020 21:17:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BACBF833B47
	for <linux-cachefs@redhat.com>; Mon, 27 Apr 2020 21:17:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-484-mKhMBVpPPKimFrTJZwGHEw-1;
	Mon, 27 Apr 2020 17:17:25 -0400
X-MC-Unique: mKhMBVpPPKimFrTJZwGHEw-1
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de
	[95.90.213.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D712E20775;
	Mon, 27 Apr 2020 21:17:23 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
	(envelope-from <mchehab@kernel.org>)
	id 1jTB7y-000Hjp-4y; Mon, 27 Apr 2020 23:17:22 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Mon, 27 Apr 2020 23:16:55 +0200
Message-Id: <cfe4cb1bf8e1f0093d44c30801ec42e74721e543.1588021877.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1588021877.git.mchehab+huawei@kernel.org>
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03RLHf6k026072
X-loop: linux-cachefs@redhat.com
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [Linux-cachefs] [PATCH v3 03/29] docs: filesystems:
	caching/netfs-api.txt: convert it to ReST
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add a SPDX header;
- Adjust document and section titles;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add it to filesystems/caching/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/filesystems/caching/fscache.rst |   2 +-
 Documentation/filesystems/caching/index.rst   |   1 +
 .../caching/{netfs-api.txt => netfs-api.rst}  | 172 ++++++++----------
 fs/fscache/cookie.c                           |   2 +-
 include/linux/fscache.h                       |  42 ++---
 5 files changed, 103 insertions(+), 116 deletions(-)
 rename Documentation/filesystems/caching/{netfs-api.txt => netfs-api.rst} (91%)

diff --git a/Documentation/filesystems/caching/fscache.rst b/Documentation/filesystems/caching/fscache.rst
index 950602147aa5..dd1297d884d0 100644
--- a/Documentation/filesystems/caching/fscache.rst
+++ b/Documentation/filesystems/caching/fscache.rst
@@ -183,7 +183,7 @@ reside in one cache.
 
 The netfs API to FS-Cache can be found in:
 
-	Documentation/filesystems/caching/netfs-api.txt
+	Documentation/filesystems/caching/netfs-api.rst
 
 The cache backend API to FS-Cache can be found in:
 
diff --git a/Documentation/filesystems/caching/index.rst b/Documentation/filesystems/caching/index.rst
index f488747630aa..d0651db450fb 100644
--- a/Documentation/filesystems/caching/index.rst
+++ b/Documentation/filesystems/caching/index.rst
@@ -8,3 +8,4 @@ Filesystem Caching
 
    fscache
    object
+   netfs-api
diff --git a/Documentation/filesystems/caching/netfs-api.txt b/Documentation/filesystems/caching/netfs-api.rst
similarity index 91%
rename from Documentation/filesystems/caching/netfs-api.txt
rename to Documentation/filesystems/caching/netfs-api.rst
index ba968e8f5704..d9f14b8610ba 100644
--- a/Documentation/filesystems/caching/netfs-api.txt
+++ b/Documentation/filesystems/caching/netfs-api.rst
@@ -1,6 +1,8 @@
-			===============================
-			FS-CACHE NETWORK FILESYSTEM API
-			===============================
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================
+FS-Cache Network Filesystem API
+===============================
 
 There's an API by which a network filesystem can make use of the FS-Cache
 facilities.  This is based around a number of principles:
@@ -19,7 +21,7 @@ facilities.  This is based around a number of principles:
 
 This API is declared in <linux/fscache.h>.
 
-This document contains the following sections:
+.. This document contains the following sections:
 
 	 (1) Network filesystem definition
 	 (2) Index definition
@@ -41,12 +43,11 @@ This document contains the following sections:
 	(18) FS-Cache specific page flags.
 
 
-=============================
-NETWORK FILESYSTEM DEFINITION
+Network Filesystem Definition
 =============================
 
 FS-Cache needs a description of the network filesystem.  This is specified
-using a record of the following structure:
+using a record of the following structure::
 
 	struct fscache_netfs {
 		uint32_t			version;
@@ -71,7 +72,7 @@ The fields are:
      another parameter passed into the registration function.
 
 For example, kAFS (linux/fs/afs/) uses the following definitions to describe
-itself:
+itself::
 
 	struct fscache_netfs afs_cache_netfs = {
 		.version	= 0,
@@ -79,8 +80,7 @@ itself:
 	};
 
 
-================
-INDEX DEFINITION
+Index Definition
 ================
 
 Indices are used for two purposes:
@@ -114,11 +114,10 @@ There are some limits on indices:
      function is recursive.  Too many layers will run the kernel out of stack.
 
 
-=================
-OBJECT DEFINITION
+Object Definition
 =================
 
-To define an object, a structure of the following type should be filled out:
+To define an object, a structure of the following type should be filled out::
 
 	struct fscache_cookie_def
 	{
@@ -149,16 +148,13 @@ This has the following fields:
 
      This is one of the following values:
 
-	(*) FSCACHE_COOKIE_TYPE_INDEX
-
+	FSCACHE_COOKIE_TYPE_INDEX
 	    This defines an index, which is a special FS-Cache type.
 
-	(*) FSCACHE_COOKIE_TYPE_DATAFILE
-
+	FSCACHE_COOKIE_TYPE_DATAFILE
 	    This defines an ordinary data file.
 
-	(*) Any other value between 2 and 255
-
+	Any other value between 2 and 255
 	    This defines an extraordinary object such as an XATTR.
 
  (2) The name of the object type (NUL terminated unless all 16 chars are used)
@@ -192,9 +188,14 @@ This has the following fields:
 
      If present, the function should return one of the following values:
 
-	(*) FSCACHE_CHECKAUX_OKAY		- the entry is okay as is
-	(*) FSCACHE_CHECKAUX_NEEDS_UPDATE	- the entry requires update
-	(*) FSCACHE_CHECKAUX_OBSOLETE		- the entry should be deleted
+	FSCACHE_CHECKAUX_OKAY
+	    - the entry is okay as is
+
+	FSCACHE_CHECKAUX_NEEDS_UPDATE
+	    - the entry requires update
+
+	FSCACHE_CHECKAUX_OBSOLETE
+	    - the entry should be deleted
 
      This function can also be used to extract data from the auxiliary data in
      the cache and copy it into the netfs's structures.
@@ -236,32 +237,30 @@ This has the following fields:
      This function is not required for indices as they're not permitted data.
 
 
-===================================
-NETWORK FILESYSTEM (UN)REGISTRATION
+Network Filesystem (Un)registration
 ===================================
 
 The first step is to declare the network filesystem to the cache.  This also
 involves specifying the layout of the primary index (for AFS, this would be the
 "cell" level).
 
-The registration function is:
+The registration function is::
 
 	int fscache_register_netfs(struct fscache_netfs *netfs);
 
 It just takes a pointer to the netfs definition.  It returns 0 or an error as
 appropriate.
 
-For kAFS, registration is done as follows:
+For kAFS, registration is done as follows::
 
 	ret = fscache_register_netfs(&afs_cache_netfs);
 
-The last step is, of course, unregistration:
+The last step is, of course, unregistration::
 
 	void fscache_unregister_netfs(struct fscache_netfs *netfs);
 
 
-================
-CACHE TAG LOOKUP
+Cache Tag Lookup
 ================
 
 FS-Cache permits the use of more than one cache.  To permit particular index
@@ -270,7 +269,7 @@ representation tags.  This step is optional; it can be left entirely up to
 FS-Cache as to which cache should be used.  The problem with doing that is that
 FS-Cache will always pick the first cache that was registered.
 
-To get the representation for a named tag:
+To get the representation for a named tag::
 
 	struct fscache_cache_tag *fscache_lookup_cache_tag(const char *name);
 
@@ -278,7 +277,7 @@ This takes a text string as the name and returns a representation of a tag.  It
 will never return an error.  It may return a dummy tag, however, if it runs out
 of memory; this will inhibit caching with this tag.
 
-Any representation so obtained must be released by passing it to this function:
+Any representation so obtained must be released by passing it to this function::
 
 	void fscache_release_cache_tag(struct fscache_cache_tag *tag);
 
@@ -286,13 +285,12 @@ The tag will be retrieved by FS-Cache when it calls the object definition
 operation select_cache().
 
 
-==================
-INDEX REGISTRATION
+Index Registration
 ==================
 
 The third step is to inform FS-Cache about part of an index hierarchy that can
 be used to locate files.  This is done by requesting a cookie for each index in
-the path to the file:
+the path to the file::
 
 	struct fscache_cookie *
 	fscache_acquire_cookie(struct fscache_cookie *parent,
@@ -339,7 +337,7 @@ must be enabled to do anything with it.  A disabled cookie can be enabled by
 calling fscache_enable_cookie() (see below).
 
 For example, with AFS, a cell would be added to the primary index.  This index
-entry would have a dependent inode containing volume mappings within this cell:
+entry would have a dependent inode containing volume mappings within this cell::
 
 	cell->cache =
 		fscache_acquire_cookie(afs_cache_netfs.primary_index,
@@ -349,7 +347,7 @@ entry would have a dependent inode containing volume mappings within this cell:
 				       cell, 0, true);
 
 And then a particular volume could be added to that index by ID, creating
-another index for vnodes (AFS inode equivalents):
+another index for vnodes (AFS inode equivalents)::
 
 	volume->cache =
 		fscache_acquire_cookie(volume->cell->cache,
@@ -359,13 +357,12 @@ another index for vnodes (AFS inode equivalents):
 				       volume, 0, true);
 
 
-======================
-DATA FILE REGISTRATION
+Data File Registration
 ======================
 
 The fourth step is to request a data file be created in the cache.  This is
 identical to index cookie acquisition.  The only difference is that the type in
-the object definition should be something other than index type.
+the object definition should be something other than index type::
 
 	vnode->cache =
 		fscache_acquire_cookie(volume->cache,
@@ -375,15 +372,14 @@ the object definition should be something other than index type.
 				       vnode, vnode->status.size, true);
 
 
-=================================
-MISCELLANEOUS OBJECT REGISTRATION
+Miscellaneous Object Registration
 =================================
 
 An optional step is to request an object of miscellaneous type be created in
 the cache.  This is almost identical to index cookie acquisition.  The only
 difference is that the type in the object definition should be something other
 than index type.  While the parent object could be an index, it's more likely
-it would be some other type of object such as a data file.
+it would be some other type of object such as a data file::
 
 	xattr->cache =
 		fscache_acquire_cookie(vnode->cache,
@@ -396,13 +392,12 @@ Miscellaneous objects might be used to store extended attributes or directory
 entries for example.
 
 
-==========================
-SETTING THE DATA FILE SIZE
+Setting the Data File Size
 ==========================
 
 The fifth step is to set the physical attributes of the file, such as its size.
 This doesn't automatically reserve any space in the cache, but permits the
-cache to adjust its metadata for data tracking appropriately:
+cache to adjust its metadata for data tracking appropriately::
 
 	int fscache_attr_changed(struct fscache_cookie *cookie);
 
@@ -417,8 +412,7 @@ some point in the future, and as such, it may happen after the function returns
 to the caller.  The attribute adjustment excludes read and write operations.
 
 
-=====================
-PAGE ALLOC/READ/WRITE
+Page alloc/read/write
 =====================
 
 And the sixth step is to store and retrieve pages in the cache.  There are
@@ -441,7 +435,7 @@ PAGE READ
 
 Firstly, the netfs should ask FS-Cache to examine the caches and read the
 contents cached for a particular page of a particular file if present, or else
-allocate space to store the contents if not:
+allocate space to store the contents if not::
 
 	typedef
 	void (*fscache_rw_complete_t)(struct page *page,
@@ -474,14 +468,14 @@ Else if there's a copy of the page resident in the cache:
 
  (4) When the read is complete, end_io_func() will be invoked with:
 
-     (*) The netfs data supplied when the cookie was created.
+       * The netfs data supplied when the cookie was created.
 
-     (*) The page descriptor.
+       * The page descriptor.
 
-     (*) The context argument passed to the above function.  This will be
+       * The context argument passed to the above function.  This will be
          maintained with the get_context/put_context functions mentioned above.
 
-     (*) An argument that's 0 on success or negative for an error code.
+       * An argument that's 0 on success or negative for an error code.
 
      If an error occurs, it should be assumed that the page contains no usable
      data.  fscache_readpages_cancel() may need to be called.
@@ -504,11 +498,11 @@ This function may also return -ENOMEM or -EINTR, in which case it won't have
 read any data from the cache.
 
 
-PAGE ALLOCATE
+Page Allocate
 -------------
 
 Alternatively, if there's not expected to be any data in the cache for a page
-because the file has been extended, a block can simply be allocated instead:
+because the file has been extended, a block can simply be allocated instead::
 
 	int fscache_alloc_page(struct fscache_cookie *cookie,
 			       struct page *page,
@@ -523,12 +517,12 @@ The mark_pages_cached() cookie operation will be called on the page if
 successful.
 
 
-PAGE WRITE
+Page Write
 ----------
 
 Secondly, if the netfs changes the contents of the page (either due to an
 initial download or if a user performs a write), then the page should be
-written back to the cache:
+written back to the cache::
 
 	int fscache_write_page(struct fscache_cookie *cookie,
 			       struct page *page,
@@ -566,11 +560,11 @@ place if unforeseen circumstances arose (such as a disk error).
 Writing takes place asynchronously.
 
 
-MULTIPLE PAGE READ
+Multiple Page Read
 ------------------
 
 A facility is provided to read several pages at once, as requested by the
-readpages() address space operation:
+readpages() address space operation::
 
 	int fscache_read_or_alloc_pages(struct fscache_cookie *cookie,
 					struct address_space *mapping,
@@ -598,7 +592,7 @@ This works in a similar way to fscache_read_or_alloc_page(), except:
      be returned.
 
      Otherwise, if all pages had reads dispatched, then 0 will be returned, the
-     list will be empty and *nr_pages will be 0.
+     list will be empty and ``*nr_pages`` will be 0.
 
  (4) end_io_func will be called once for each page being read as the reads
      complete.  It will be called in process context if error != 0, but it may
@@ -609,13 +603,13 @@ some of the pages being read and some being allocated.  Those pages will have
 been marked appropriately and will need uncaching.
 
 
-CANCELLATION OF UNREAD PAGES
+Cancellation of Unread Pages
 ----------------------------
 
 If one or more pages are passed to fscache_read_or_alloc_pages() but not then
 read from the cache and also not read from the underlying filesystem then
 those pages will need to have any marks and reservations removed.  This can be
-done by calling:
+done by calling::
 
 	void fscache_readpages_cancel(struct fscache_cookie *cookie,
 				      struct list_head *pages);
@@ -625,11 +619,10 @@ fscache_read_or_alloc_pages().  Every page in the pages list will be examined
 and any that have PG_fscache set will be uncached.
 
 
-==============
-PAGE UNCACHING
+Page Uncaching
 ==============
 
-To uncache a page, this function should be called:
+To uncache a page, this function should be called::
 
 	void fscache_uncache_page(struct fscache_cookie *cookie,
 				  struct page *page);
@@ -644,12 +637,12 @@ data file must be retired (see the relinquish cookie function below).
 
 Furthermore, note that this does not cancel the asynchronous read or write
 operation started by the read/alloc and write functions, so the page
-invalidation functions must use:
+invalidation functions must use::
 
 	bool fscache_check_page_write(struct fscache_cookie *cookie,
 				      struct page *page);
 
-to see if a page is being written to the cache, and:
+to see if a page is being written to the cache, and::
 
 	void fscache_wait_on_page_write(struct fscache_cookie *cookie,
 					struct page *page);
@@ -660,7 +653,7 @@ to wait for it to finish if it is.
 When releasepage() is being implemented, a special FS-Cache function exists to
 manage the heuristics of coping with vmscan trying to eject pages, which may
 conflict with the cache trying to write pages to the cache (which may itself
-need to allocate memory):
+need to allocate memory)::
 
 	bool fscache_maybe_release_page(struct fscache_cookie *cookie,
 					struct page *page,
@@ -676,12 +669,12 @@ storage request to complete, or it may attempt to cancel the storage request -
 in which case the page will not be stored in the cache this time.
 
 
-BULK INODE PAGE UNCACHE
+Bulk Image Page Uncache
 -----------------------
 
 A convenience routine is provided to perform an uncache on all the pages
 attached to an inode.  This assumes that the pages on the inode correspond on a
-1:1 basis with the pages in the cache.
+1:1 basis with the pages in the cache::
 
 	void fscache_uncache_all_inode_pages(struct fscache_cookie *cookie,
 					     struct inode *inode);
@@ -692,12 +685,11 @@ written to the cache and for the cache to finish with the page generally.  No
 error is returned.
 
 
-===============================
-INDEX AND DATA FILE CONSISTENCY
+Index and Data File consistency
 ===============================
 
 To find out whether auxiliary data for an object is up to data within the
-cache, the following function can be called:
+cache, the following function can be called::
 
 	int fscache_check_consistency(struct fscache_cookie *cookie,
 				      const void *aux_data);
@@ -708,7 +700,7 @@ data buffer first.  It returns 0 if it is and -ESTALE if it isn't; it may also
 return -ENOMEM and -ERESTARTSYS.
 
 To request an update of the index data for an index or other object, the
-following function should be called:
+following function should be called::
 
 	void fscache_update_cookie(struct fscache_cookie *cookie,
 				   const void *aux_data);
@@ -721,8 +713,7 @@ Note that partial updates may happen automatically at other times, such as when
 data blocks are added to a data file object.
 
 
-=================
-COOKIE ENABLEMENT
+Cookie Enablement
 =================
 
 Cookies exist in one of two states: enabled and disabled.  If a cookie is
@@ -731,7 +722,7 @@ invalidate its state; allocate, read or write backing pages - though it is
 still possible to uncache pages and relinquish the cookie.
 
 The initial enablement state is set by fscache_acquire_cookie(), but the cookie
-can be enabled or disabled later.  To disable a cookie, call:
+can be enabled or disabled later.  To disable a cookie, call::
 
 	void fscache_disable_cookie(struct fscache_cookie *cookie,
 				    const void *aux_data,
@@ -746,7 +737,7 @@ All possible failures are handled internally.  The caller should consider
 calling fscache_uncache_all_inode_pages() afterwards to make sure all page
 markings are cleared up.
 
-Cookies can be enabled or reenabled with:
+Cookies can be enabled or reenabled with::
 
     	void fscache_enable_cookie(struct fscache_cookie *cookie,
 				   const void *aux_data,
@@ -771,13 +762,12 @@ In both cases, the cookie's auxiliary data buffer is updated from aux_data if
 that is non-NULL inside the enablement lock before proceeding.
 
 
-===============================
-MISCELLANEOUS COOKIE OPERATIONS
+Miscellaneous Cookie operations
 ===============================
 
 There are a number of operations that can be used to control cookies:
 
- (*) Cookie pinning:
+     * Cookie pinning::
 
 	int fscache_pin_cookie(struct fscache_cookie *cookie);
 	void fscache_unpin_cookie(struct fscache_cookie *cookie);
@@ -790,7 +780,7 @@ There are a number of operations that can be used to control cookies:
      -ENOSPC if there isn't enough space to honour the operation, -ENOMEM or
      -EIO if there's any other problem.
 
- (*) Data space reservation:
+   * Data space reservation::
 
 	int fscache_reserve_space(struct fscache_cookie *cookie, loff_t size);
 
@@ -809,11 +799,10 @@ There are a number of operations that can be used to control cookies:
      make space if it's not in use.
 
 
-=====================
-COOKIE UNREGISTRATION
+Cookie Unregistration
 =====================
 
-To get rid of a cookie, this function should be called.
+To get rid of a cookie, this function should be called::
 
 	void fscache_relinquish_cookie(struct fscache_cookie *cookie,
 				       const void *aux_data,
@@ -835,16 +824,14 @@ the cookies for "child" indices, objects and pages have been relinquished
 first.
 
 
-==================
-INDEX INVALIDATION
+Index Invalidation
 ==================
 
 There is no direct way to invalidate an index subtree.  To do this, the caller
 should relinquish and retire the cookie they have, and then acquire a new one.
 
 
-======================
-DATA FILE INVALIDATION
+Data File Invalidation
 ======================
 
 Sometimes it will be necessary to invalidate an object that contains data.
@@ -853,7 +840,7 @@ change - at which point the netfs has to throw away all the state it had for an
 inode and reload from the server.
 
 To indicate that a cache object should be invalidated, the following function
-can be called:
+can be called::
 
 	void fscache_invalidate(struct fscache_cookie *cookie);
 
@@ -868,13 +855,12 @@ auxiliary data update operation as it is very likely these will have changed.
 
 Using the following function, the netfs can wait for the invalidation operation
 to have reached a point at which it can start submitting ordinary operations
-once again:
+once again::
 
 	void fscache_wait_on_invalidate(struct fscache_cookie *cookie);
 
 
-===========================
-FS-CACHE SPECIFIC PAGE FLAG
+FS-cache Specific Page Flag
 ===========================
 
 FS-Cache makes use of a page flag, PG_private_2, for its own purpose.  This is
@@ -898,7 +884,7 @@ was given under certain circumstances.
 This bit does not overlap with such as PG_private.  This means that FS-Cache
 can be used with a filesystem that uses the block buffering code.
 
-There are a number of operations defined on this flag:
+There are a number of operations defined on this flag::
 
 	int PageFsCache(struct page *page);
 	void SetPageFsCache(struct page *page)
diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 0ce39658a620..751bc5b1cddf 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -4,7 +4,7 @@
  * Copyright (C) 2004-2007 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  *
- * See Documentation/filesystems/caching/netfs-api.txt for more information on
+ * See Documentation/filesystems/caching/netfs-api.rst for more information on
  * the netfs API.
  */
 
diff --git a/include/linux/fscache.h b/include/linux/fscache.h
index ad044c0cb1f3..a1c928fe98e7 100644
--- a/include/linux/fscache.h
+++ b/include/linux/fscache.h
@@ -6,7 +6,7 @@
  *
  * NOTE!!! See:
  *
- *	Documentation/filesystems/caching/netfs-api.txt
+ *	Documentation/filesystems/caching/netfs-api.rst
  *
  * for a description of the network filesystem interface declared here.
  */
@@ -233,7 +233,7 @@ extern void __fscache_enable_cookie(struct fscache_cookie *, const void *, loff_
  *
  * Register a filesystem as desiring caching services if they're available.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -253,7 +253,7 @@ int fscache_register_netfs(struct fscache_netfs *netfs)
  * Indicate that a filesystem no longer desires caching services for the
  * moment.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -270,7 +270,7 @@ void fscache_unregister_netfs(struct fscache_netfs *netfs)
  * Acquire a specific cache referral tag that can be used to select a specific
  * cache in which to cache an index.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -288,7 +288,7 @@ struct fscache_cache_tag *fscache_lookup_cache_tag(const char *name)
  *
  * Release a reference to a cache referral tag previously looked up.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -315,7 +315,7 @@ void fscache_release_cache_tag(struct fscache_cache_tag *tag)
  * that can be used to locate files.  This is done by requesting a cookie for
  * each index in the path to the file.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -351,7 +351,7 @@ struct fscache_cookie *fscache_acquire_cookie(
  * provided to update the auxiliary data in the cache before the object is
  * disconnected.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -394,7 +394,7 @@ int fscache_check_consistency(struct fscache_cookie *cookie,
  * cookie.  The auxiliary data on the cookie will be updated first if @aux_data
  * is set.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -410,7 +410,7 @@ void fscache_update_cookie(struct fscache_cookie *cookie, const void *aux_data)
  *
  * Permit data-storage cache objects to be pinned in the cache.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -425,7 +425,7 @@ int fscache_pin_cookie(struct fscache_cookie *cookie)
  *
  * Permit data-storage cache objects to be unpinned from the cache.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -441,7 +441,7 @@ void fscache_unpin_cookie(struct fscache_cookie *cookie)
  * changed.  This includes the data size.  These attributes will be obtained
  * through the get_attr() cookie definition op.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -463,7 +463,7 @@ int fscache_attr_changed(struct fscache_cookie *cookie)
  *
  * This can be called with spinlocks held.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -479,7 +479,7 @@ void fscache_invalidate(struct fscache_cookie *cookie)
  *
  * Wait for the invalidation of an object to complete.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -498,7 +498,7 @@ void fscache_wait_on_invalidate(struct fscache_cookie *cookie)
  * cookie so that a write to that object within the space can always be
  * honoured.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -533,7 +533,7 @@ int fscache_reserve_space(struct fscache_cookie *cookie, loff_t size)
  * Else, if the page is unbacked, -ENODATA is returned and a block may have
  * been allocated in the cache.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -582,7 +582,7 @@ int fscache_read_or_alloc_page(struct fscache_cookie *cookie,
  * regard to different pages, the return values are prioritised in that order.
  * Any pages submitted for reading are removed from the pages list.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -617,7 +617,7 @@ int fscache_read_or_alloc_pages(struct fscache_cookie *cookie,
  * Else, a block will be allocated if one wasn't already, and 0 will be
  * returned
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -667,7 +667,7 @@ void fscache_readpages_cancel(struct fscache_cookie *cookie,
  * be cleared at the completion of the write to indicate the success or failure
  * of the operation.  Note that the completion may happen before the return.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -693,7 +693,7 @@ int fscache_write_page(struct fscache_cookie *cookie,
  * Note that this cannot cancel any outstanding I/O operations between this
  * page and the cache.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -711,7 +711,7 @@ void fscache_uncache_page(struct fscache_cookie *cookie,
  *
  * Ask the cache if a page is being written to the cache.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
@@ -731,7 +731,7 @@ bool fscache_check_page_write(struct fscache_cookie *cookie,
  * Ask the cache to wake us up when a page is no longer being written to the
  * cache.
  *
- * See Documentation/filesystems/caching/netfs-api.txt for a complete
+ * See Documentation/filesystems/caching/netfs-api.rst for a complete
  * description.
  */
 static inline
-- 
2.25.4


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

