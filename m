Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJHPZCVQMGQEOLH75FI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 74135809349
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:22:45 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-58e2b7e4f94sf1464232eaf.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:22:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984164; cv=pass;
        d=google.com; s=arc-20160816;
        b=n1uCed3M6znTYPhQQKgvOMjxUZwoTpjUjCO3hKCUZJCCE0wwowEW4xzJlqQIFFOxXj
         cgTWBRTwJ8bngODP07IcQ55VxllWznywMeCjlxxrxMbQJuvcjhC9zBHr09nDKIxwu9bR
         AaJw9xfcq/BfW1ytApSxmU1vr9nt1Ew50qemHQARQx2hCrJmo8DuCMxR+yQuj53urm8L
         jfMCvKpL3NF5UFDdAwWtN6tXpvivP7ACoGah77agoR8DNvyb+5m5sixwSA/0/hKVyrWx
         hg8l4vRcpOt9IcF3k6Phc+6+Mxu8Oz4qKB8qpmO6ZwLPpjR23RseJBhbUJ9rZzQCt8G3
         +AOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=oQ7I96tCQbis/+LjFuAlw2qV/R9Gd7cM6ocuGDdwbjQ=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=C3j5QDEeN2UNvKlG8Ec2gl4LgBBlgWMJ8DjdowSDG3MRYA+Me1cqvMo59oQsF8NKbt
         45d/g1XDiE8w0H03vGLxnGGadJNceVHov7SfgL6RIH7Mr1gEXW1o0K4NOO1eW1WkT+jj
         z0hPNIQ7oCIwp+ZNfV7iRSVthkLNH/ZJJvjK1L0vV0w4fFhFgdjVCy5JgGdLhtkq3Ob3
         pJ/ydfhcE6vtAGuySse59U8qD0f2NlxsI3IjwzrVyuwug0XPBbxKbUXrwUQZiOXQZAuv
         6Im9B1kterNLDSG1dMxPYQq0GPS/1aoTrtuo1VSYWzJtNDtb0NlVnKS5PiUjN0vClGd2
         i7+w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984164; x=1702588964;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ7I96tCQbis/+LjFuAlw2qV/R9Gd7cM6ocuGDdwbjQ=;
        b=OzbJu1hmjWz2leLFjNkdEAf2wAVl/E1fEa+isNrTikwpVfegF8SxI+vmovSMMhsrC4
         osvXvJ+7qsgZyJS9HJCY0iY68u9GHbaNI+sb6xMuipnrkuqcaaRGr2pqMClFmkI8p/is
         ONp9izglG6c9VkQGfhAt3Q0ObdIwU/j2oFEv1S/XEp1Tp9BRk6Jha33noBGYfgTGw6gI
         mFtM3TYUnD0bTBQhazlUq1SKCuUXwb/x0rKFf7MXY9ywmUvfsFVd6Rehoq6mcLu8GD5d
         /WJ91eInvQIJob6+/UwFomXJBPPjqN4kclqrIqkW5RDUzn/6dy77W+lZ6pS2engq9ieW
         Cjdw==
X-Gm-Message-State: AOJu0Yw/FdXDpG74p0DbK0YvHn2WRmrDlE6tEcwdKI2d8+Tis4NmXowG
	NzI9g8QxfYtuuQFB4jUky4RGeg==
X-Google-Smtp-Source: AGHT+IHRTXZmhhKw1tNAxiKIrqErpu+k1oCGhdoA1QffYUD8+FkvjFaz+etkE4A7bf+2SYwWCi4WLw==
X-Received: by 2002:a4a:9197:0:b0:58e:3275:3e4b with SMTP id d23-20020a4a9197000000b0058e32753e4bmr2632537ooh.19.1701984164311;
        Thu, 07 Dec 2023 13:22:44 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:602:b0:58d:ed89:f343 with SMTP id
 e2-20020a056820060200b0058ded89f343ls2369620oow.1.-pod-prod-09-us; Thu, 07
 Dec 2023 13:22:43 -0800 (PST)
X-Received: by 2002:a05:6808:18a8:b0:3ad:c497:1336 with SMTP id bi40-20020a05680818a800b003adc4971336mr3994657oib.16.1701984163697;
        Thu, 07 Dec 2023 13:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984163; cv=none;
        d=google.com; s=arc-20160816;
        b=TbNmwP038BbOr/muyyGRMbufQmp+Z+7n2PYPlwI+2qxkKvH/Dz9ZsKRmy7E/Mhmcg1
         O1mnBTEbv/n6LfQh9osMdnmhk30L34/n1k8+C8jVDsnXVb6UTdeYt+AkOgUKrmqmpfgp
         9CzRglfr/sOSVS70mBX8BBmXh4bjrtIbToBrOLY1SM+6dRxJ29IceiW/EeIZ3jc0NKjW
         dAnNMZhOpbU4alxaB31SFU6HIfe0fW35qCw9g0qol+x6Z9CvC2SmEO33nYSPj+pcgxZ6
         DjChIiAuFDbUSnxFlCPTK9xNBZrtCmTIfZAGIAO1a10g3foDnIUkINCRfv3mlFdzIL9E
         jp/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=wQZ/Z/NT5+hAvWe9Uf0FGBMHxHMTiJ+Q89UZt0KNWcU=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=lpeg5Ozf4DvgWl9I5OlC907uMuIdYIzPG0YkamNLusKi1LC+qlN93Rbi1qIfG4G4pK
         AO+LH0+jOy9DMfBPsERBjMfWJkGuSfhNj8ibiuwReQa9N2g3vlwqb5v56FxOdbrAUh+o
         ITBDi9QRjo1D0q7dg0tWaKgYBqQzN70JuDQZ5zk29x4245GeouUyRoAdpGtE5gHTvQC/
         Cs3x4Z8HIYqIc8AbVvOe2fSlsXdeEkkpYC4DOpT44SPXW69J5m7WlQ25EW3uD6AS2sb2
         qPfAWJ3o2/LnRd9OHV4lASFdN12f9CbCBhUviVaUlusYrQohVa7fWBcusnt/YakCW++G
         T/Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s8-20020a05620a0bc800b0077d6c64912esi615546qki.52.2023.12.07.13.22.43
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:22:43 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-GJCRjlERPGiRJ7aWiF39xQ-1; Thu, 07 Dec 2023 16:22:42 -0500
X-MC-Unique: GJCRjlERPGiRJ7aWiF39xQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F77185A783
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:22:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D2D48C185A5; Thu,  7 Dec 2023 21:22:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25345C15880;
	Thu,  7 Dec 2023 21:22:39 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/59] afs: Don't use folio->private to record partial modification
Date: Thu,  7 Dec 2023 21:21:16 +0000
Message-ID: <20231207212206.1379128-10-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

AFS currently uses folio->private to store the range of bytes within a
folio that have been modified - the idea being that if we have, say, a 2MiB
folio and someone writes a single byte, we only have to write back that
single page and not the whole 2MiB folio - thereby saving on network
bandwidth.

Remove this, at least for now, and accept the extra network load (which
doesn't matter in the common case of writing a whole file at a time from
beginning to end).

This makes folio->private available for netfslib to use.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/afs/file.c              |  67 -------------
 fs/afs/internal.h          |  56 -----------
 fs/afs/write.c             | 188 ++++++++-----------------------------
 include/trace/events/afs.h |  16 +---
 4 files changed, 42 insertions(+), 285 deletions(-)

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 9142fda7dbd6..0d783e5b2147 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -386,63 +386,6 @@ const struct netfs_request_ops afs_req_ops = {
 	.issue_read		= afs_issue_read,
 };
 
-/*
- * Adjust the dirty region of the page on truncation or full invalidation,
- * getting rid of the markers altogether if the region is entirely invalidated.
- */
-static void afs_invalidate_dirty(struct folio *folio, size_t offset,
-				 size_t length)
-{
-	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
-	unsigned long priv;
-	unsigned int f, t, end = offset + length;
-
-	priv = (unsigned long)folio_get_private(folio);
-
-	/* we clean up only if the entire page is being invalidated */
-	if (offset == 0 && length == folio_size(folio))
-		goto full_invalidate;
-
-	 /* If the page was dirtied by page_mkwrite(), the PTE stays writable
-	  * and we don't get another notification to tell us to expand it
-	  * again.
-	  */
-	if (afs_is_folio_dirty_mmapped(priv))
-		return;
-
-	/* We may need to shorten the dirty region */
-	f = afs_folio_dirty_from(folio, priv);
-	t = afs_folio_dirty_to(folio, priv);
-
-	if (t <= offset || f >= end)
-		return; /* Doesn't overlap */
-
-	if (f < offset && t > end)
-		return; /* Splits the dirty region - just absorb it */
-
-	if (f >= offset && t <= end)
-		goto undirty;
-
-	if (f < offset)
-		t = offset;
-	else
-		f = end;
-	if (f == t)
-		goto undirty;
-
-	priv = afs_folio_dirty(folio, f, t);
-	folio_change_private(folio, (void *)priv);
-	trace_afs_folio_dirty(vnode, tracepoint_string("trunc"), folio);
-	return;
-
-undirty:
-	trace_afs_folio_dirty(vnode, tracepoint_string("undirty"), folio);
-	folio_clear_dirty_for_io(folio);
-full_invalidate:
-	trace_afs_folio_dirty(vnode, tracepoint_string("inval"), folio);
-	folio_detach_private(folio);
-}
-
 /*
  * invalidate part or all of a page
  * - release a page and clean up its private data if offset is 0 (indicating
@@ -453,11 +396,6 @@ static void afs_invalidate_folio(struct folio *folio, size_t offset,
 {
 	_enter("{%lu},%zu,%zu", folio->index, offset, length);
 
-	BUG_ON(!folio_test_locked(folio));
-
-	if (folio_get_private(folio))
-		afs_invalidate_dirty(folio, offset, length);
-
 	folio_wait_fscache(folio);
 	_leave("");
 }
@@ -485,11 +423,6 @@ static bool afs_release_folio(struct folio *folio, gfp_t gfp)
 	fscache_note_page_release(afs_vnode_cache(vnode));
 #endif
 
-	if (folio_test_private(folio)) {
-		trace_afs_folio_dirty(vnode, tracepoint_string("rel"), folio);
-		folio_detach_private(folio);
-	}
-
 	/* Indicate that the folio can be released */
 	_leave(" = T");
 	return true;
diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index ba25a75609a2..ec173e58ddfe 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -893,62 +893,6 @@ static inline void afs_invalidate_cache(struct afs_vnode *vnode, unsigned int fl
 			   i_size_read(&vnode->netfs.inode), flags);
 }
 
-/*
- * We use folio->private to hold the amount of the folio that we've written to,
- * splitting the field into two parts.  However, we need to represent a range
- * 0...FOLIO_SIZE, so we reduce the resolution if the size of the folio
- * exceeds what we can encode.
- */
-#ifdef CONFIG_64BIT
-#define __AFS_FOLIO_PRIV_MASK		0x7fffffffUL
-#define __AFS_FOLIO_PRIV_SHIFT		32
-#define __AFS_FOLIO_PRIV_MMAPPED	0x80000000UL
-#else
-#define __AFS_FOLIO_PRIV_MASK		0x7fffUL
-#define __AFS_FOLIO_PRIV_SHIFT		16
-#define __AFS_FOLIO_PRIV_MMAPPED	0x8000UL
-#endif
-
-static inline unsigned int afs_folio_dirty_resolution(struct folio *folio)
-{
-	int shift = folio_shift(folio) - (__AFS_FOLIO_PRIV_SHIFT - 1);
-	return (shift > 0) ? shift : 0;
-}
-
-static inline size_t afs_folio_dirty_from(struct folio *folio, unsigned long priv)
-{
-	unsigned long x = priv & __AFS_FOLIO_PRIV_MASK;
-
-	/* The lower bound is inclusive */
-	return x << afs_folio_dirty_resolution(folio);
-}
-
-static inline size_t afs_folio_dirty_to(struct folio *folio, unsigned long priv)
-{
-	unsigned long x = (priv >> __AFS_FOLIO_PRIV_SHIFT) & __AFS_FOLIO_PRIV_MASK;
-
-	/* The upper bound is immediately beyond the region */
-	return (x + 1) << afs_folio_dirty_resolution(folio);
-}
-
-static inline unsigned long afs_folio_dirty(struct folio *folio, size_t from, size_t to)
-{
-	unsigned int res = afs_folio_dirty_resolution(folio);
-	from >>= res;
-	to = (to - 1) >> res;
-	return (to << __AFS_FOLIO_PRIV_SHIFT) | from;
-}
-
-static inline unsigned long afs_folio_dirty_mmapped(unsigned long priv)
-{
-	return priv | __AFS_FOLIO_PRIV_MMAPPED;
-}
-
-static inline bool afs_is_folio_dirty_mmapped(unsigned long priv)
-{
-	return priv & __AFS_FOLIO_PRIV_MMAPPED;
-}
-
 #include <trace/events/afs.h>
 
 /*****************************************************************************/
diff --git a/fs/afs/write.c b/fs/afs/write.c
index 7354aa5775fc..6aa272acb95c 100644
--- a/fs/afs/write.c
+++ b/fs/afs/write.c
@@ -16,7 +16,8 @@
 
 static int afs_writepages_region(struct address_space *mapping,
 				 struct writeback_control *wbc,
-				 loff_t start, loff_t end, loff_t *_next,
+				 unsigned long long start,
+				 unsigned long long end, loff_t *_next,
 				 bool max_one_loop);
 
 static void afs_write_to_cache(struct afs_vnode *vnode, loff_t start, size_t len,
@@ -34,25 +35,6 @@ static void afs_folio_start_fscache(bool caching, struct folio *folio)
 }
 #endif
 
-/*
- * Flush out a conflicting write.  This may extend the write to the surrounding
- * pages if also dirty and contiguous to the conflicting region..
- */
-static int afs_flush_conflicting_write(struct address_space *mapping,
-				       struct folio *folio)
-{
-	struct writeback_control wbc = {
-		.sync_mode	= WB_SYNC_ALL,
-		.nr_to_write	= LONG_MAX,
-		.range_start	= folio_pos(folio),
-		.range_end	= LLONG_MAX,
-	};
-	loff_t next;
-
-	return afs_writepages_region(mapping, &wbc, folio_pos(folio), LLONG_MAX,
-				     &next, true);
-}
-
 /*
  * prepare to perform part of a write to a page
  */
@@ -62,10 +44,6 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 {
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
 	struct folio *folio;
-	unsigned long priv;
-	unsigned f, from;
-	unsigned t, to;
-	pgoff_t index;
 	int ret;
 
 	_enter("{%llx:%llu},%llx,%x",
@@ -79,49 +57,20 @@ int afs_write_begin(struct file *file, struct address_space *mapping,
 	if (ret < 0)
 		return ret;
 
-	index = folio_index(folio);
-	from = pos - index * PAGE_SIZE;
-	to = from + len;
-
 try_again:
 	/* See if this page is already partially written in a way that we can
 	 * merge the new write with.
 	 */
-	if (folio_test_private(folio)) {
-		priv = (unsigned long)folio_get_private(folio);
-		f = afs_folio_dirty_from(folio, priv);
-		t = afs_folio_dirty_to(folio, priv);
-		ASSERTCMP(f, <=, t);
-
-		if (folio_test_writeback(folio)) {
-			trace_afs_folio_dirty(vnode, tracepoint_string("alrdy"), folio);
-			folio_unlock(folio);
-			goto wait_for_writeback;
-		}
-		/* If the file is being filled locally, allow inter-write
-		 * spaces to be merged into writes.  If it's not, only write
-		 * back what the user gives us.
-		 */
-		if (!test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags) &&
-		    (to < f || from > t))
-			goto flush_conflicting_write;
+	if (folio_test_writeback(folio)) {
+		trace_afs_folio_dirty(vnode, tracepoint_string("alrdy"), folio);
+		folio_unlock(folio);
+		goto wait_for_writeback;
 	}
 
 	*_page = folio_file_page(folio, pos / PAGE_SIZE);
 	_leave(" = 0");
 	return 0;
 
-	/* The previous write and this write aren't adjacent or overlapping, so
-	 * flush the page out.
-	 */
-flush_conflicting_write:
-	trace_afs_folio_dirty(vnode, tracepoint_string("confl"), folio);
-	folio_unlock(folio);
-
-	ret = afs_flush_conflicting_write(mapping, folio);
-	if (ret < 0)
-		goto error;
-
 wait_for_writeback:
 	ret = folio_wait_writeback_killable(folio);
 	if (ret < 0)
@@ -147,9 +96,6 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 {
 	struct folio *folio = page_folio(subpage);
 	struct afs_vnode *vnode = AFS_FS_I(file_inode(file));
-	unsigned long priv;
-	unsigned int f, from = offset_in_folio(folio, pos);
-	unsigned int t, to = from + copied;
 	loff_t i_size, write_end_pos;
 
 	_enter("{%llx:%llu},{%lx}",
@@ -179,23 +125,6 @@ int afs_write_end(struct file *file, struct address_space *mapping,
 		fscache_update_cookie(afs_vnode_cache(vnode), NULL, &write_end_pos);
 	}
 
-	if (folio_test_private(folio)) {
-		priv = (unsigned long)folio_get_private(folio);
-		f = afs_folio_dirty_from(folio, priv);
-		t = afs_folio_dirty_to(folio, priv);
-		if (from < f)
-			f = from;
-		if (to > t)
-			t = to;
-		priv = afs_folio_dirty(folio, f, t);
-		folio_change_private(folio, (void *)priv);
-		trace_afs_folio_dirty(vnode, tracepoint_string("dirty+"), folio);
-	} else {
-		priv = afs_folio_dirty(folio, from, to);
-		folio_attach_private(folio, (void *)priv);
-		trace_afs_folio_dirty(vnode, tracepoint_string("dirty"), folio);
-	}
-
 	if (folio_mark_dirty(folio))
 		_debug("dirtied %lx", folio_index(folio));
 
@@ -300,7 +229,6 @@ static void afs_pages_written_back(struct afs_vnode *vnode, loff_t start, unsign
 		}
 
 		trace_afs_folio_dirty(vnode, tracepoint_string("clear"), folio);
-		folio_detach_private(folio);
 		folio_end_writeback(folio);
 	}
 
@@ -454,17 +382,12 @@ static void afs_extend_writeback(struct address_space *mapping,
 				 long *_count,
 				 loff_t start,
 				 loff_t max_len,
-				 bool new_content,
 				 bool caching,
-				 unsigned int *_len)
+				 size_t *_len)
 {
 	struct folio_batch fbatch;
 	struct folio *folio;
-	unsigned long priv;
-	unsigned int psize, filler = 0;
-	unsigned int f, t;
-	loff_t len = *_len;
-	pgoff_t index = (start + len) / PAGE_SIZE;
+	pgoff_t index = (start + *_len) / PAGE_SIZE;
 	bool stop = true;
 	unsigned int i;
 
@@ -492,7 +415,7 @@ static void afs_extend_writeback(struct address_space *mapping,
 				continue;
 			}
 
-			/* Has the page moved or been split? */
+			/* Has the folio moved or been split? */
 			if (unlikely(folio != xas_reload(&xas))) {
 				folio_put(folio);
 				break;
@@ -510,24 +433,13 @@ static void afs_extend_writeback(struct address_space *mapping,
 				break;
 			}
 
-			psize = folio_size(folio);
-			priv = (unsigned long)folio_get_private(folio);
-			f = afs_folio_dirty_from(folio, priv);
-			t = afs_folio_dirty_to(folio, priv);
-			if (f != 0 && !new_content) {
-				folio_unlock(folio);
-				folio_put(folio);
-				break;
-			}
-
-			len += filler + t;
-			filler = psize - t;
-			if (len >= max_len || *_count <= 0)
+			index += folio_nr_pages(folio);
+			*_count -= folio_nr_pages(folio);
+			*_len += folio_size(folio);
+			stop = false;
+			if (*_len >= max_len || *_count <= 0)
 				stop = true;
-			else if (t == psize || new_content)
-				stop = false;
 
-			index += folio_nr_pages(folio);
 			if (!folio_batch_add(&fbatch, folio))
 				break;
 			if (stop)
@@ -552,16 +464,12 @@ static void afs_extend_writeback(struct address_space *mapping,
 				BUG();
 			folio_start_writeback(folio);
 			afs_folio_start_fscache(caching, folio);
-
-			*_count -= folio_nr_pages(folio);
 			folio_unlock(folio);
 		}
 
 		folio_batch_release(&fbatch);
 		cond_resched();
 	} while (!stop);
-
-	*_len = len;
 }
 
 /*
@@ -571,14 +479,13 @@ static void afs_extend_writeback(struct address_space *mapping,
 static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
 						struct writeback_control *wbc,
 						struct folio *folio,
-						loff_t start, loff_t end)
+						unsigned long long start,
+						unsigned long long end)
 {
 	struct afs_vnode *vnode = AFS_FS_I(mapping->host);
 	struct iov_iter iter;
-	unsigned long priv;
-	unsigned int offset, to, len, max_len;
-	loff_t i_size = i_size_read(&vnode->netfs.inode);
-	bool new_content = test_bit(AFS_VNODE_NEW_CONTENT, &vnode->flags);
+	unsigned long long i_size = i_size_read(&vnode->netfs.inode);
+	size_t len, max_len;
 	bool caching = fscache_cookie_enabled(afs_vnode_cache(vnode));
 	long count = wbc->nr_to_write;
 	int ret;
@@ -595,13 +502,9 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
 	 * immediately lockable, is not dirty or is missing, or we reach the
 	 * end of the range.
 	 */
-	priv = (unsigned long)folio_get_private(folio);
-	offset = afs_folio_dirty_from(folio, priv);
-	to = afs_folio_dirty_to(folio, priv);
 	trace_afs_folio_dirty(vnode, tracepoint_string("store"), folio);
 
-	len = to - offset;
-	start += offset;
+	len = folio_size(folio);
 	if (start < i_size) {
 		/* Trim the write to the EOF; the extra data is ignored.  Also
 		 * put an upper limit on the size of a single storedata op.
@@ -610,12 +513,10 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
 		max_len = min_t(unsigned long long, max_len, end - start + 1);
 		max_len = min_t(unsigned long long, max_len, i_size - start);
 
-		if (len < max_len &&
-		    (to == folio_size(folio) || new_content))
+		if (len < max_len)
 			afs_extend_writeback(mapping, vnode, &count,
-					     start, max_len, new_content,
-					     caching, &len);
-		len = min_t(loff_t, len, max_len);
+					     start, max_len, caching, &len);
+		len = min_t(unsigned long long, len, i_size - start);
 	}
 
 	/* We now have a contiguous set of dirty pages, each with writeback
@@ -625,7 +526,7 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
 	folio_unlock(folio);
 
 	if (start < i_size) {
-		_debug("write back %x @%llx [%llx]", len, start, i_size);
+		_debug("write back %zx @%llx [%llx]", len, start, i_size);
 
 		/* Speculatively write to the cache.  We have to fix this up
 		 * later if the store fails.
@@ -635,7 +536,7 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
 		iov_iter_xarray(&iter, ITER_SOURCE, &mapping->i_pages, start, len);
 		ret = afs_store_data(vnode, &iter, start, false);
 	} else {
-		_debug("write discard %x @%llx [%llx]", len, start, i_size);
+		_debug("write discard %zx @%llx [%llx]", len, start, i_size);
 
 		/* The dirty region was entirely beyond the EOF. */
 		fscache_clear_page_bits(mapping, start, len, caching);
@@ -691,7 +592,8 @@ static ssize_t afs_write_back_from_locked_folio(struct address_space *mapping,
  */
 static int afs_writepages_region(struct address_space *mapping,
 				 struct writeback_control *wbc,
-				 loff_t start, loff_t end, loff_t *_next,
+				 unsigned long long start,
+				 unsigned long long end, loff_t *_next,
 				 bool max_one_loop)
 {
 	struct folio *folio;
@@ -903,7 +805,6 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 	struct inode *inode = file_inode(file);
 	struct afs_vnode *vnode = AFS_FS_I(inode);
 	struct afs_file *af = file->private_data;
-	unsigned long priv;
 	vm_fault_t ret = VM_FAULT_RETRY;
 
 	_enter("{{%llx:%llu}},{%lx}", vnode->fid.vid, vnode->fid.vnode, folio_index(folio));
@@ -927,24 +828,15 @@ vm_fault_t afs_page_mkwrite(struct vm_fault *vmf)
 	if (folio_lock_killable(folio) < 0)
 		goto out;
 
-	/* We mustn't change folio->private until writeback is complete as that
-	 * details the portion of the page we need to write back and we might
-	 * need to redirty the page if there's a problem.
-	 */
 	if (folio_wait_writeback_killable(folio) < 0) {
 		folio_unlock(folio);
 		goto out;
 	}
 
-	priv = afs_folio_dirty(folio, 0, folio_size(folio));
-	priv = afs_folio_dirty_mmapped(priv);
-	if (folio_test_private(folio)) {
-		folio_change_private(folio, (void *)priv);
+	if (folio_test_dirty(folio))
 		trace_afs_folio_dirty(vnode, tracepoint_string("mkwrite+"), folio);
-	} else {
-		folio_attach_private(folio, (void *)priv);
+	else
 		trace_afs_folio_dirty(vnode, tracepoint_string("mkwrite"), folio);
-	}
 	file_update_time(file);
 
 	ret = VM_FAULT_LOCKED;
@@ -989,30 +881,26 @@ int afs_launder_folio(struct folio *folio)
 	struct afs_vnode *vnode = AFS_FS_I(folio_inode(folio));
 	struct iov_iter iter;
 	struct bio_vec bv;
-	unsigned long priv;
-	unsigned int f, t;
+	unsigned long long fend, i_size = vnode->netfs.inode.i_size;
+	size_t len;
 	int ret = 0;
 
 	_enter("{%lx}", folio->index);
 
-	priv = (unsigned long)folio_get_private(folio);
-	if (folio_clear_dirty_for_io(folio)) {
-		f = 0;
-		t = folio_size(folio);
-		if (folio_test_private(folio)) {
-			f = afs_folio_dirty_from(folio, priv);
-			t = afs_folio_dirty_to(folio, priv);
-		}
+	if (folio_clear_dirty_for_io(folio) && folio_pos(folio) < i_size) {
+		len = folio_size(folio);
+		fend = folio_pos(folio) + len;
+		if (vnode->netfs.inode.i_size < fend)
+			len = fend - i_size;
 
-		bvec_set_folio(&bv, folio, t - f, f);
-		iov_iter_bvec(&iter, ITER_SOURCE, &bv, 1, bv.bv_len);
+		bvec_set_folio(&bv, folio, len, 0);
+		iov_iter_bvec(&iter, WRITE, &bv, 1, len);
 
 		trace_afs_folio_dirty(vnode, tracepoint_string("launder"), folio);
-		ret = afs_store_data(vnode, &iter, folio_pos(folio) + f, true);
+		ret = afs_store_data(vnode, &iter, folio_pos(folio), true);
 	}
 
 	trace_afs_folio_dirty(vnode, tracepoint_string("laundered"), folio);
-	folio_detach_private(folio);
 	folio_wait_fscache(folio);
 	return ret;
 }
diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index 597677acc6b1..08506680350c 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -846,26 +846,18 @@ TRACE_EVENT(afs_folio_dirty,
 		    __field(struct afs_vnode *,		vnode)
 		    __field(const char *,		where)
 		    __field(pgoff_t,			index)
-		    __field(unsigned long,		from)
-		    __field(unsigned long,		to)
+		    __field(size_t,			size)
 			     ),
 
 	    TP_fast_assign(
-		    unsigned long priv = (unsigned long)folio_get_private(folio);
 		    __entry->vnode = vnode;
 		    __entry->where = where;
 		    __entry->index = folio_index(folio);
-		    __entry->from  = afs_folio_dirty_from(folio, priv);
-		    __entry->to    = afs_folio_dirty_to(folio, priv);
-		    __entry->to   |= (afs_is_folio_dirty_mmapped(priv) ?
-				      (1UL << (BITS_PER_LONG - 1)) : 0);
+		    __entry->size = folio_size(folio);
 			   ),
 
-	    TP_printk("vn=%p %lx %s %lx-%lx%s",
-		      __entry->vnode, __entry->index, __entry->where,
-		      __entry->from,
-		      __entry->to & ~(1UL << (BITS_PER_LONG - 1)),
-		      __entry->to & (1UL << (BITS_PER_LONG - 1)) ? " M" : "")
+	    TP_printk("vn=%p ix=%05lx s=%05lx %s",
+		      __entry->vnode, __entry->index, __entry->size, __entry->where)
 	    );
 
 TRACE_EVENT(afs_call_state,

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

