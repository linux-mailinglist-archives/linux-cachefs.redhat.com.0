Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C73E52BACD6
	for <lists+linux-cachefs@lfdr.de>; Fri, 20 Nov 2020 16:06:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605884813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+YdnhVC5o9KKZrV40wi/h/HxIlzX0pXoyJyDSEI8PK0=;
	b=LVBh64lbbylLZNjDlfbtxbfimiamVAZHTxgxMzNY3KpmKVkfupit49xD9s94zEIivzQleu
	3uYjmy+4z66jZ3b7aa+yA+8g3XkHkj4sZoEGoO0r6udoM1quxxZ7evb9RVI2hRs+e2vd26
	nyvxURehBN1u2KEwva7cipohop77QLY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-o_ywalUENKez-gr-LkOOWA-1; Fri, 20 Nov 2020 10:06:52 -0500
X-MC-Unique: o_ywalUENKez-gr-LkOOWA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBDB4100C602;
	Fri, 20 Nov 2020 15:06:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBDB61349A;
	Fri, 20 Nov 2020 15:06:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B79DD4A7C6;
	Fri, 20 Nov 2020 15:06:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AKF6mcI013373 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 10:06:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5946C5C1D5; Fri, 20 Nov 2020 15:06:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-246.rdu2.redhat.com
	[10.10.112.246])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EE95C5C224;
	Fri, 20 Nov 2020 15:06:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Trond Myklebust <trondmy@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Steve French <sfrench@samba.org>,
	Dominique Martinet <asmadeus@codewreck.org>
Date: Fri, 20 Nov 2020 15:06:38 +0000
Message-ID: <160588479816.3465195.553952688795241765.stgit@warthog.procyon.org.uk>
In-Reply-To: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
References: <160588455242.3465195.3214733858273019178.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [RFC PATCH 19/76] mm: Implement readahead_control
	pageset expansion
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a function, readahead_expand(), that expands the set of pages
specified by a readahead_control object to encompass a revised area with a
proposed size and length.

The proposed area must include all of the old area and may be expanded yet
more by this function so that the edges align on (transparent huge) page
boundaries as allocated.

The expansion will be cut short if a page already exists in either of the
areas being expanded into.  Note that any expansion made in such a case is
not rolled back.

This will be used by fscache so that reads can be expanded to cache granule
boundaries, thereby allowing whole granules to be stored in the cache, but
there are other potential users also.

Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 include/linux/pagemap.h |    2 +
 mm/readahead.c          |   70 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 67fe07096103..852e3dd59aa0 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -774,6 +774,8 @@ extern void __delete_from_page_cache(struct page *page, void *shadow);
 int replace_page_cache_page(struct page *old, struct page *new, gfp_t gfp_mask);
 void delete_from_page_cache_batch(struct address_space *mapping,
 				  struct pagevec *pvec);
+void readahead_expand(struct readahead_control *ractl,
+		      loff_t new_start, size_t new_len);
 
 /*
  * Like add_to_page_cache_locked, but used to add newly allocated pages:
diff --git a/mm/readahead.c b/mm/readahead.c
index c5b0457415be..4446dada0bc2 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -638,3 +638,73 @@ SYSCALL_DEFINE3(readahead, int, fd, loff_t, offset, size_t, count)
 {
 	return ksys_readahead(fd, offset, count);
 }
+
+/**
+ * readahead_expand - Expand a readahead request
+ * @ractl: The request to be expanded
+ * @new_start: The revised start
+ * @new_len: The revised size of the request
+ *
+ * Attempt to expand a readahead request outwards from the current size to the
+ * specified size by inserting locked pages before and after the current window
+ * to increase the size to the new window.  This may involve the insertion of
+ * THPs, in which case the window may get expanded even beyond what was
+ * requested.
+ *
+ * The algorithm will stop if it encounters a conflicting page already in the
+ * pagecache and leave a smaller expansion than requested.
+ *
+ * The caller must check for this by examining the revised @ractl object for a
+ * different expansion than was requested.
+ */
+void readahead_expand(struct readahead_control *ractl,
+		      loff_t new_start, size_t new_len)
+{
+	struct address_space *mapping = ractl->mapping;
+	pgoff_t new_index, new_nr_pages;
+	gfp_t gfp_mask = readahead_gfp_mask(mapping);
+
+	new_index = new_start / PAGE_SIZE;
+
+	/* Expand the leading edge downwards */
+	while (ractl->_index > new_index) {
+		unsigned long index = ractl->_index - 1;
+		struct page *page = xa_load(&mapping->i_pages, index);
+
+		if (page && !xa_is_value(page))
+			return; /* Page apparently present */
+
+		page = __page_cache_alloc(gfp_mask);
+		if (!page)
+			return;
+		if (add_to_page_cache_lru(page, mapping, index, gfp_mask) < 0) {
+			put_page(page);
+			return;
+		}
+
+		ractl->_nr_pages++;
+		ractl->_index = page->index;
+	}
+
+	new_len += new_start - readahead_pos(ractl);
+	new_nr_pages = DIV_ROUND_UP(new_len, PAGE_SIZE);
+
+	/* Expand the trailing edge upwards */
+	while (ractl->_nr_pages < new_nr_pages) {
+		unsigned long index = ractl->_index + ractl->_nr_pages;
+		struct page *page = xa_load(&mapping->i_pages, index);
+
+		if (page && !xa_is_value(page))
+			return; /* Page apparently present */
+
+		page = __page_cache_alloc(gfp_mask);
+		if (!page)
+			return;
+		if (add_to_page_cache_lru(page, mapping, index, gfp_mask) < 0) {
+			put_page(page);
+			return;
+		}
+		ractl->_nr_pages++;
+	}
+}
+EXPORT_SYMBOL(readahead_expand);


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

