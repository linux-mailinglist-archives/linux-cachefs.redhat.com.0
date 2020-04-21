Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9F46D1B2D3A
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Apr 2020 18:55:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587488102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XcR4OU7APmufHC+UwaplhdwOD8RoE4bHEA6S0uVt2Go=;
	b=RBjY4+m5muOIVivgJL/OYIs6Z4QQeJvYnFFTR0psbgdNq251ZKVMtUrJwau9NQYqZzMOAv
	spdtdi3269yE0SPIGqQ5yL9nSxE+4/lZE51qhBRoL82Q6rW8XmfSt0cvhA6BPCmGmqorSt
	ll1sQsolxXjJHe6wjEn2xQ6YanzVsp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-VkLpEZsSPGyfnmcliRiVpA-1; Tue, 21 Apr 2020 12:55:00 -0400
X-MC-Unique: VkLpEZsSPGyfnmcliRiVpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E062085B6FB;
	Tue, 21 Apr 2020 16:54:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8DB0194BB;
	Tue, 21 Apr 2020 16:54:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABC5118089CF;
	Tue, 21 Apr 2020 16:54:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03LGspcD018900 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 12:54:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33FD62166B27; Tue, 21 Apr 2020 16:54:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F32E2166B29
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:54:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BF6386BCD3
	for <linux-cachefs@redhat.com>; Tue, 21 Apr 2020 16:54:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-175-EXyX6axbOV-zsQqQ22sgkA-1;
	Tue, 21 Apr 2020 12:54:47 -0400
X-MC-Unique: EXyX6axbOV-zsQqQ22sgkA-1
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de
	[95.90.212.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E7F752071E;
	Tue, 21 Apr 2020 16:54:43 +0000 (UTC)
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
	(envelope-from <mchehab@kernel.org>)
	id 1jQwAU-00CmDl-6a; Tue, 21 Apr 2020 18:54:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Tue, 21 Apr 2020 18:54:17 +0200
Message-Id: <fba9149ea122e603c6010296dec693f3abc30e24.1587487612.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1587487612.git.mchehab+huawei@kernel.org>
References: <cover.1587487612.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03LGspcD018900
X-loop: linux-cachefs@redhat.com
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [Linux-cachefs] [PATCH v2 06/29] docs: filesystems:
	caching/backend-api.txt: convert it to ReST
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

- Add a SPDX header;
- Adjust document and section titles;
- Some whitespace fixes and new line breaks;
- Mark literal blocks as such;
- Add table markups;
- Add it to filesystems/caching/index.rst.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{backend-api.txt => backend-api.rst}      | 165 +++++++++---------
 Documentation/filesystems/caching/fscache.rst |   2 +-
 Documentation/filesystems/caching/index.rst   |   1 +
 fs/fscache/cache.c                            |   8 +-
 fs/fscache/object.c                           |   2 +-
 include/linux/fscache-cache.h                 |   4 +-
 6 files changed, 92 insertions(+), 90 deletions(-)
 rename Documentation/filesystems/caching/{backend-api.txt => backend-api.rst} (87%)

diff --git a/Documentation/filesystems/caching/backend-api.txt b/Documentation/filesystems/caching/backend-api.rst
similarity index 87%
rename from Documentation/filesystems/caching/backend-api.txt
rename to Documentation/filesystems/caching/backend-api.rst
index c418280c915f..19fbf6b9aa36 100644
--- a/Documentation/filesystems/caching/backend-api.txt
+++ b/Documentation/filesystems/caching/backend-api.rst
@@ -1,6 +1,8 @@
-			  ==========================
-			  FS-CACHE CACHE BACKEND API
-			  ==========================
+.. SPDX-License-Identifier: GPL-2.0
+
+==========================
+FS-Cache Cache backend API
+==========================
 
 The FS-Cache system provides an API by which actual caches can be supplied to
 FS-Cache for it to then serve out to network filesystems and other interested
@@ -9,15 +11,14 @@ parties.
 This API is declared in <linux/fscache-cache.h>.
 
 
-====================================
-INITIALISING AND REGISTERING A CACHE
+Initialising and Registering a Cache
 ====================================
 
 To start off, a cache definition must be initialised and registered for each
 cache the backend wants to make available.  For instance, CacheFS does this in
 the fill_super() operation on mounting.
 
-The cache definition (struct fscache_cache) should be initialised by calling:
+The cache definition (struct fscache_cache) should be initialised by calling::
 
 	void fscache_init_cache(struct fscache_cache *cache,
 				struct fscache_cache_ops *ops,
@@ -26,17 +27,17 @@ The cache definition (struct fscache_cache) should be initialised by calling:
 
 Where:
 
- (*) "cache" is a pointer to the cache definition;
+   * "cache" is a pointer to the cache definition;
 
- (*) "ops" is a pointer to the table of operations that the backend supports on
+   * "ops" is a pointer to the table of operations that the backend supports on
      this cache; and
 
- (*) "idfmt" is a format and printf-style arguments for constructing a label
+   * "idfmt" is a format and printf-style arguments for constructing a label
      for the cache.
 
 
 The cache should then be registered with FS-Cache by passing a pointer to the
-previously initialised cache definition to:
+previously initialised cache definition to::
 
 	int fscache_add_cache(struct fscache_cache *cache,
 			      struct fscache_object *fsdef,
@@ -44,12 +45,12 @@ previously initialised cache definition to:
 
 Two extra arguments should also be supplied:
 
- (*) "fsdef" which should point to the object representation for the FS-Cache
+   * "fsdef" which should point to the object representation for the FS-Cache
      master index in this cache.  Netfs primary index entries will be created
      here.  FS-Cache keeps the caller's reference to the index object if
      successful and will release it upon withdrawal of the cache.
 
- (*) "tagname" which, if given, should be a text string naming this cache.  If
+   * "tagname" which, if given, should be a text string naming this cache.  If
      this is NULL, the identifier will be used instead.  For CacheFS, the
      identifier is set to name the underlying block device and the tag can be
      supplied by mount.
@@ -58,20 +59,18 @@ This function may return -ENOMEM if it ran out of memory or -EEXIST if the tag
 is already in use.  0 will be returned on success.
 
 
-=====================
-UNREGISTERING A CACHE
+Unregistering a Cache
 =====================
 
 A cache can be withdrawn from the system by calling this function with a
-pointer to the cache definition:
+pointer to the cache definition::
 
 	void fscache_withdraw_cache(struct fscache_cache *cache);
 
 In CacheFS's case, this is called by put_super().
 
 
-========
-SECURITY
+Security
 ========
 
 The cache methods are executed one of two contexts:
@@ -89,8 +88,7 @@ be masqueraded for the duration of the cache driver's access to the cache.
 This is left to the cache to handle; FS-Cache makes no effort in this regard.
 
 
-===================================
-CONTROL AND STATISTICS PRESENTATION
+Control and Statistics Presentation
 ===================================
 
 The cache may present data to the outside world through FS-Cache's interfaces
@@ -101,11 +99,10 @@ is enabled.  This is accessible through the kobject struct fscache_cache::kobj
 and is for use by the cache as it sees fit.
 
 
-========================
-RELEVANT DATA STRUCTURES
+Relevant Data Structures
 ========================
 
- (*) Index/Data file FS-Cache representation cookie:
+   * Index/Data file FS-Cache representation cookie::
 
 	struct fscache_cookie {
 		struct fscache_object_def	*def;
@@ -121,7 +118,7 @@ RELEVANT DATA STRUCTURES
      cache operations.
 
 
- (*) In-cache object representation:
+   * In-cache object representation::
 
 	struct fscache_object {
 		int				debug_id;
@@ -150,7 +147,7 @@ RELEVANT DATA STRUCTURES
      initialised by calling fscache_object_init(object).
 
 
- (*) FS-Cache operation record:
+   * FS-Cache operation record::
 
 	struct fscache_operation {
 		atomic_t		usage;
@@ -173,7 +170,7 @@ RELEVANT DATA STRUCTURES
      an operation needs more processing time, it should be enqueued again.
 
 
- (*) FS-Cache retrieval operation record:
+   * FS-Cache retrieval operation record::
 
 	struct fscache_retrieval {
 		struct fscache_operation op;
@@ -198,7 +195,7 @@ RELEVANT DATA STRUCTURES
      it sees fit.
 
 
- (*) FS-Cache storage operation record:
+   * FS-Cache storage operation record::
 
 	struct fscache_storage {
 		struct fscache_operation op;
@@ -212,16 +209,17 @@ RELEVANT DATA STRUCTURES
      storage.
 
 
-================
-CACHE OPERATIONS
+Cache Operations
 ================
 
 The cache backend provides FS-Cache with a table of operations that can be
 performed on the denizens of the cache.  These are held in a structure of type:
 
-	struct fscache_cache_ops
+	::
 
- (*) Name of cache provider [mandatory]:
+	    struct fscache_cache_ops
+
+   * Name of cache provider [mandatory]::
 
 	const char *name
 
@@ -229,7 +227,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      the backend.
 
 
- (*) Allocate a new object [mandatory]:
+   * Allocate a new object [mandatory]::
 
 	struct fscache_object *(*alloc_object)(struct fscache_cache *cache,
 					       struct fscache_cookie *cookie)
@@ -244,7 +242,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      form once lookup is complete or aborted.
 
 
- (*) Look up and create object [mandatory]:
+   * Look up and create object [mandatory]::
 
 	void (*lookup_object)(struct fscache_object *object)
 
@@ -263,7 +261,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      to abort the lookup of that object.
 
 
- (*) Release lookup data [mandatory]:
+   * Release lookup data [mandatory]::
 
 	void (*lookup_complete)(struct fscache_object *object)
 
@@ -271,7 +269,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      using to perform a lookup.
 
 
- (*) Increment object refcount [mandatory]:
+   * Increment object refcount [mandatory]::
 
 	struct fscache_object *(*grab_object)(struct fscache_object *object)
 
@@ -280,7 +278,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      It should return the object pointer if successful.
 
 
- (*) Lock/Unlock object [mandatory]:
+   * Lock/Unlock object [mandatory]::
 
 	void (*lock_object)(struct fscache_object *object)
 	void (*unlock_object)(struct fscache_object *object)
@@ -289,7 +287,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      to schedule with the lock held, so a spinlock isn't sufficient.
 
 
- (*) Pin/Unpin object [optional]:
+   * Pin/Unpin object [optional]::
 
 	int (*pin_object)(struct fscache_object *object)
 	void (*unpin_object)(struct fscache_object *object)
@@ -299,7 +297,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      enough space in the cache to permit this.
 
 
- (*) Check coherency state of an object [mandatory]:
+   * Check coherency state of an object [mandatory]::
 
 	int (*check_consistency)(struct fscache_object *object)
 
@@ -308,7 +306,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      if they're consistent and -ESTALE otherwise.  -ENOMEM and -ERESTARTSYS
      may also be returned.
 
- (*) Update object [mandatory]:
+   * Update object [mandatory]::
 
 	int (*update_object)(struct fscache_object *object)
 
@@ -317,7 +315,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      obtained by calling object->cookie->def->get_aux()/get_attr().
 
 
- (*) Invalidate data object [mandatory]:
+   * Invalidate data object [mandatory]::
 
 	int (*invalidate_object)(struct fscache_operation *op)
 
@@ -329,7 +327,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      fscache_op_complete() must be called on op before returning.
 
 
- (*) Discard object [mandatory]:
+   * Discard object [mandatory]::
 
 	void (*drop_object)(struct fscache_object *object)
 
@@ -341,7 +339,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      caller.  The caller will invoke the put_object() method as appropriate.
 
 
- (*) Release object reference [mandatory]:
+   * Release object reference [mandatory]::
 
 	void (*put_object)(struct fscache_object *object)
 
@@ -349,7 +347,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      be freed when all the references to it are released.
 
 
- (*) Synchronise a cache [mandatory]:
+   * Synchronise a cache [mandatory]::
 
 	void (*sync)(struct fscache_cache *cache)
 
@@ -357,7 +355,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      device.
 
 
- (*) Dissociate a cache [mandatory]:
+   * Dissociate a cache [mandatory]::
 
 	void (*dissociate_pages)(struct fscache_cache *cache)
 
@@ -365,7 +363,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      cache withdrawal.
 
 
- (*) Notification that the attributes on a netfs file changed [mandatory]:
+   * Notification that the attributes on a netfs file changed [mandatory]::
 
 	int (*attr_changed)(struct fscache_object *object);
 
@@ -386,7 +384,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      execution of this operation.
 
 
- (*) Reserve cache space for an object's data [optional]:
+   * Reserve cache space for an object's data [optional]::
 
 	int (*reserve_space)(struct fscache_object *object, loff_t size);
 
@@ -404,7 +402,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      size if larger than that already.
 
 
- (*) Request page be read from cache [mandatory]:
+   * Request page be read from cache [mandatory]::
 
 	int (*read_or_alloc_page)(struct fscache_retrieval *op,
 				  struct page *page,
@@ -446,7 +444,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      with.  This will complete the operation when all pages are dealt with.
 
 
- (*) Request pages be read from cache [mandatory]:
+   * Request pages be read from cache [mandatory]::
 
 	int (*read_or_alloc_pages)(struct fscache_retrieval *op,
 				   struct list_head *pages,
@@ -457,7 +455,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      of pages instead of one page.  Any pages on which a read operation is
      started must be added to the page cache for the specified mapping and also
      to the LRU.  Such pages must also be removed from the pages list and
-     *nr_pages decremented per page.
+     ``*nr_pages`` decremented per page.
 
      If there was an error such as -ENOMEM, then that should be returned; else
      if one or more pages couldn't be read or allocated, then -ENOBUFS should
@@ -466,7 +464,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      returned.
 
 
- (*) Request page be allocated in the cache [mandatory]:
+   * Request page be allocated in the cache [mandatory]::
 
 	int (*allocate_page)(struct fscache_retrieval *op,
 			     struct page *page,
@@ -482,7 +480,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      allocated, then the netfs page should be marked and 0 returned.
 
 
- (*) Request pages be allocated in the cache [mandatory]:
+   * Request pages be allocated in the cache [mandatory]::
 
 	int (*allocate_pages)(struct fscache_retrieval *op,
 			      struct list_head *pages,
@@ -493,7 +491,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      nr_pages should be treated as for the read_or_alloc_pages() method.
 
 
- (*) Request page be written to cache [mandatory]:
+   * Request page be written to cache [mandatory]::
 
 	int (*write_page)(struct fscache_storage *op,
 			  struct page *page);
@@ -514,7 +512,7 @@ performed on the denizens of the cache.  These are held in a structure of type:
      appropriately.
 
 
- (*) Discard retained per-page metadata [mandatory]:
+   * Discard retained per-page metadata [mandatory]::
 
 	void (*uncache_page)(struct fscache_object *object, struct page *page)
 
@@ -523,13 +521,12 @@ performed on the denizens of the cache.  These are held in a structure of type:
      maintains for this page.
 
 
-==================
-FS-CACHE UTILITIES
+FS-Cache Utilities
 ==================
 
 FS-Cache provides some utilities that a cache backend may make use of:
 
- (*) Note occurrence of an I/O error in a cache:
+   * Note occurrence of an I/O error in a cache::
 
 	void fscache_io_error(struct fscache_cache *cache)
 
@@ -541,7 +538,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      This does not actually withdraw the cache.  That must be done separately.
 
 
- (*) Invoke the retrieval I/O completion function:
+   * Invoke the retrieval I/O completion function::
 
 	void fscache_end_io(struct fscache_retrieval *op, struct page *page,
 			    int error);
@@ -550,8 +547,8 @@ FS-Cache provides some utilities that a cache backend may make use of:
      error value should be 0 if successful and an error otherwise.
 
 
- (*) Record that one or more pages being retrieved or allocated have been dealt
-     with:
+   * Record that one or more pages being retrieved or allocated have been dealt
+     with::
 
 	void fscache_retrieval_complete(struct fscache_retrieval *op,
 					int n_pages);
@@ -562,7 +559,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      completed.
 
 
- (*) Record operation completion:
+   * Record operation completion::
 
 	void fscache_op_complete(struct fscache_operation *op);
 
@@ -571,7 +568,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      one or more pending operations to start running.
 
 
- (*) Set highest store limit:
+   * Set highest store limit::
 
 	void fscache_set_store_limit(struct fscache_object *object,
 				     loff_t i_size);
@@ -581,7 +578,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      rejected by fscache_read_alloc_page() and co with -ENOBUFS.
 
 
- (*) Mark pages as being cached:
+   * Mark pages as being cached::
 
 	void fscache_mark_pages_cached(struct fscache_retrieval *op,
 				       struct pagevec *pagevec);
@@ -590,7 +587,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      the netfs must call fscache_uncache_page() to unmark the pages.
 
 
- (*) Perform coherency check on an object:
+   * Perform coherency check on an object::
 
 	enum fscache_checkaux fscache_check_aux(struct fscache_object *object,
 						const void *data,
@@ -603,29 +600,26 @@ FS-Cache provides some utilities that a cache backend may make use of:
 
      One of three values will be returned:
 
-	(*) FSCACHE_CHECKAUX_OKAY
-
+	FSCACHE_CHECKAUX_OKAY
 	    The coherency data indicates the object is valid as is.
 
-	(*) FSCACHE_CHECKAUX_NEEDS_UPDATE
-
+	FSCACHE_CHECKAUX_NEEDS_UPDATE
 	    The coherency data needs updating, but otherwise the object is
 	    valid.
 
-	(*) FSCACHE_CHECKAUX_OBSOLETE
-
+	FSCACHE_CHECKAUX_OBSOLETE
 	    The coherency data indicates that the object is obsolete and should
 	    be discarded.
 
 
- (*) Initialise a freshly allocated object:
+   * Initialise a freshly allocated object::
 
 	void fscache_object_init(struct fscache_object *object);
 
      This initialises all the fields in an object representation.
 
 
- (*) Indicate the destruction of an object:
+   * Indicate the destruction of an object::
 
 	void fscache_object_destroyed(struct fscache_cache *cache);
 
@@ -635,7 +629,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      all the objects.
 
 
- (*) Indicate negative lookup on an object:
+   * Indicate negative lookup on an object::
 
 	void fscache_object_lookup_negative(struct fscache_object *object);
 
@@ -650,7 +644,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      significant - all subsequent calls are ignored.
 
 
- (*) Indicate an object has been obtained:
+   * Indicate an object has been obtained::
 
 	void fscache_obtained_object(struct fscache_object *object);
 
@@ -667,7 +661,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
         (2) that writes may now proceed against this object.
 
 
- (*) Indicate that object lookup failed:
+   * Indicate that object lookup failed::
 
 	void fscache_object_lookup_error(struct fscache_object *object);
 
@@ -676,7 +670,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      as possible.
 
 
- (*) Indicate that a stale object was found and discarded:
+   * Indicate that a stale object was found and discarded::
 
 	void fscache_object_retrying_stale(struct fscache_object *object);
 
@@ -685,7 +679,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      discarded from the cache and the lookup will be performed again.
 
 
- (*) Indicate that the caching backend killed an object:
+   * Indicate that the caching backend killed an object::
 
 	void fscache_object_mark_killed(struct fscache_object *object,
 					enum fscache_why_object_killed why);
@@ -693,13 +687,20 @@ FS-Cache provides some utilities that a cache backend may make use of:
      This is called to indicate that the cache backend preemptively killed an
      object.  The why parameter should be set to indicate the reason:
 
-	FSCACHE_OBJECT_IS_STALE - the object was stale and needs discarding.
-	FSCACHE_OBJECT_NO_SPACE - there was insufficient cache space
-	FSCACHE_OBJECT_WAS_RETIRED - the object was retired when relinquished.
-	FSCACHE_OBJECT_WAS_CULLED - the object was culled to make space.
+	FSCACHE_OBJECT_IS_STALE
+	    - the object was stale and needs discarding.
 
+	FSCACHE_OBJECT_NO_SPACE
+	    - there was insufficient cache space
 
- (*) Get and release references on a retrieval record:
+	FSCACHE_OBJECT_WAS_RETIRED
+	    - the object was retired when relinquished.
+
+	FSCACHE_OBJECT_WAS_CULLED
+	    - the object was culled to make space.
+
+
+   * Get and release references on a retrieval record::
 
 	void fscache_get_retrieval(struct fscache_retrieval *op);
 	void fscache_put_retrieval(struct fscache_retrieval *op);
@@ -708,7 +709,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      asynchronous data retrieval and block allocation.
 
 
- (*) Enqueue a retrieval record for processing.
+   * Enqueue a retrieval record for processing::
 
 	void fscache_enqueue_retrieval(struct fscache_retrieval *op);
 
@@ -718,7 +719,7 @@ FS-Cache provides some utilities that a cache backend may make use of:
      within the callback function.
 
 
- (*) List of object state names:
+   * List of object state names::
 
 	const char *fscache_object_states[];
 
diff --git a/Documentation/filesystems/caching/fscache.rst b/Documentation/filesystems/caching/fscache.rst
index dd1297d884d0..70de86922b6a 100644
--- a/Documentation/filesystems/caching/fscache.rst
+++ b/Documentation/filesystems/caching/fscache.rst
@@ -187,7 +187,7 @@ The netfs API to FS-Cache can be found in:
 
 The cache backend API to FS-Cache can be found in:
 
-	Documentation/filesystems/caching/backend-api.txt
+	Documentation/filesystems/caching/backend-api.rst
 
 A description of the internal representations and object state machine can be
 found in:
diff --git a/Documentation/filesystems/caching/index.rst b/Documentation/filesystems/caching/index.rst
index a2cf35f89e28..033da7ac7c6e 100644
--- a/Documentation/filesystems/caching/index.rst
+++ b/Documentation/filesystems/caching/index.rst
@@ -8,6 +8,7 @@ Filesystem Caching
 
    fscache
    object
+   backend-api
    cachefiles
    netfs-api
    operations
diff --git a/fs/fscache/cache.c b/fs/fscache/cache.c
index f78793f3d21e..fcc136361415 100644
--- a/fs/fscache/cache.c
+++ b/fs/fscache/cache.c
@@ -172,7 +172,7 @@ struct fscache_cache *fscache_select_cache_for_object(
  *
  * Initialise a record of a cache and fill in the name.
  *
- * See Documentation/filesystems/caching/backend-api.txt for a complete
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
  * description.
  */
 void fscache_init_cache(struct fscache_cache *cache,
@@ -207,7 +207,7 @@ EXPORT_SYMBOL(fscache_init_cache);
  *
  * Add a cache to the system, making it available for netfs's to use.
  *
- * See Documentation/filesystems/caching/backend-api.txt for a complete
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
  * description.
  */
 int fscache_add_cache(struct fscache_cache *cache,
@@ -307,7 +307,7 @@ EXPORT_SYMBOL(fscache_add_cache);
  * Note that an I/O error occurred in a cache and that it should no longer be
  * used for anything.  This also reports the error into the kernel log.
  *
- * See Documentation/filesystems/caching/backend-api.txt for a complete
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
  * description.
  */
 void fscache_io_error(struct fscache_cache *cache)
@@ -355,7 +355,7 @@ static void fscache_withdraw_all_objects(struct fscache_cache *cache,
  * Withdraw a cache from service, unbinding all its cache objects from the
  * netfs cookies they're currently representing.
  *
- * See Documentation/filesystems/caching/backend-api.txt for a complete
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
  * description.
  */
 void fscache_withdraw_cache(struct fscache_cache *cache)
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index efaa003b8323..cb2146e02cd5 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -295,7 +295,7 @@ static void fscache_object_work_func(struct work_struct *work)
  *
  * Initialise a cache object description to its basic values.
  *
- * See Documentation/filesystems/caching/backend-api.txt for a complete
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
  * description.
  */
 void fscache_object_init(struct fscache_object *object,
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index d5ba431b5d63..ce0b5fbf239d 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -6,7 +6,7 @@
  *
  * NOTE!!! See:
  *
- *	Documentation/filesystems/caching/backend-api.txt
+ *	Documentation/filesystems/caching/backend-api.rst
  *
  * for a description of the cache backend interface declared here.
  */
@@ -454,7 +454,7 @@ static inline void fscache_object_lookup_error(struct fscache_object *object)
  * Set the maximum size an object is permitted to reach, implying the highest
  * byte that may be written.  Intended to be called by the attr_changed() op.
  *
- * See Documentation/filesystems/caching/backend-api.txt for a complete
+ * See Documentation/filesystems/caching/backend-api.rst for a complete
  * description.
  */
 static inline
-- 
2.25.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

