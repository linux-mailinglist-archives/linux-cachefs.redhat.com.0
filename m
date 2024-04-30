Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQPTYOYQMGQEF3FPEFY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB88B77D5
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:39 +0200 (CEST)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6ee39ae1281sf2543529a34.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485698; cv=pass;
        d=google.com; s=arc-20160816;
        b=KMW4FKk98vdDqWmAwDxGRIatuPkLkJrJHBC8GkCqicHTstzY97o5p/OFVyIQGfOJgI
         H3G7fGYgRwzWLn0tkOCJ6dnm/9eaM0tBpgzBhToTQRWYeVFxBMJldVHABcoUFWvGAniK
         LKKGE/IabMXBroJpM6cMdtBORB+CkjRGv3xeEJXifJqkjWaBUrBNe2SSwHHgSSjO7shr
         dSUK7M++mZf+X5T7NDxfB5cMyI5JvvJWcgwJ0YRmWwru8FovyzOgysa6gWEoFupfl/2I
         w9NMwSg8RooPK25D8ZNfB1TZLTFmA73/3wJ7MrpULOpBOxmDt2mJam2FjmPKYgIjIeCY
         YNxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=2+q/Iy6OQrWRbFayN2taDgw407XJ9zqD9WIt1NZ+n94=;
        fh=q7I07oOD+BKWpSswJENkQa9H5Cajo8xEKD1Vv0ftCJo=;
        b=pW2+GWlwIXnHpy01OjATlCeSR7TYrGjiInt+rlC4I1absxtTsBfM5tv77h04TmeCkc
         n6mWLVziQ2Esf85HzC2tN89oGcu1iIKkGVo3vAhfR0uZA6xY2rX8X7VU1GX2l6FcfkOc
         KQYmfi38trderht+Es2qttAL4wd7g93Hur3HYF0OHPSA2DI8VDrTurmx9//jZRioJfy7
         m/6q03yvHBmwAXdjworEYMfMmRLPr11cRNgZou6xLL+jWsf2z/8P8m/LP2powlgOLQ4t
         5S6cl5YDu280GB1SOB4su4mY8UK3cNHYb9zRS2Ri7nXMeLH9tmnPBud+HBXCgRuMV36k
         9rhA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485698; x=1715090498;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+q/Iy6OQrWRbFayN2taDgw407XJ9zqD9WIt1NZ+n94=;
        b=d+TEVjTwUdu2i3PS0DWMSVPlLIKg1URNOyQ44IVOrj7iz1idwfHzd3zLuLoGxm4hBr
         YZm1T7yqIbA8JIkrp2b5mfBk6n+u7BTn5ZOyhrB2vt2XxzHa80kE76cbvm1c+kPa+VCy
         /QRiQjhJoQYMawsOtTYabMyduPUqITs6msHSFE2fhjaANlJMuOCVChG57GoSEEfCq+Tz
         A84gLpFkhDS0XCUpSc0YWlU+VNEGnppXnPjY/92gFh96udgf9w48wgumv2NVpP45QfMe
         Rj/OkPdIiA5TaNiyZGEOaVfaDJveQwC3kHcjVXUNJJl/SLbUSsA4vpE8rMjkw1Y3M40p
         k/LQ==
X-Forwarded-Encrypted: i=2; AJvYcCW/yNDTl4+CdJOybN9+7DKB5KxCdK8bNwsZc4kbeaJiuJa2+7gONNF6+a8x7ETWt7R/nqJmatnvDepSW48CmySAqAk22yiAjI32gJs=
X-Gm-Message-State: AOJu0Yzed+8S8nUa9CgEkLtzLevZW25b03ainKYgeU+RequFlETwfrEs
	NtKrC9XgCHCDx9wBNjocwyd3AkJxUwHVVhLDbE5ZKokqEgW2VsrRESO69pyV4eE=
X-Google-Smtp-Source: AGHT+IEkbg25pS/4rHPlpiN/UOs4QdhqF3QGFC2FlJ9Sh2s+CDpXp/aVE6sNsKB+uqdONbrlMSPftg==
X-Received: by 2002:a9d:5e01:0:b0:6ee:98d:231c with SMTP id d1-20020a9d5e01000000b006ee098d231cmr2740158oti.7.1714485697598;
        Tue, 30 Apr 2024 07:01:37 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:1c91:b0:5ae:1f6c:8986 with SMTP id
 006d021491bc7-5af5d35e0d2ls451359eaf.1.-pod-prod-03-us; Tue, 30 Apr 2024
 07:01:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUeeWUnPlgH/Dkubv1aNKeVtJw44uD3VeXgfxVdAvwyhUdN4OWBygCFR7UK2I70y3YLN0qdJUc7tfYciCP4xkoPaaIKfxphZySwKJHtDEs=
X-Received: by 2002:a05:6808:181d:b0:3c6:eff7:7f01 with SMTP id bh29-20020a056808181d00b003c6eff77f01mr3618618oib.51.1714485696394;
        Tue, 30 Apr 2024 07:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485696; cv=none;
        d=google.com; s=arc-20160816;
        b=IVcCornF1EEOmOtbWEWbt2tJlLESYv6M6lNOOIx2jnv9nqYri+UHjsTq1ZGpZMoVmw
         ERvqiaR1DJuyLbqco/YXw8Rc3412X4dDYob81I7ULbgZD5qPnnyLYyvLaJEJFTw7Q3m1
         TlzjmajTrluy7DchGLxG/25KadL0yEZI1eBreGGvPGtJjqyuo8NP5i/j6kDvksh0lxvZ
         UJvTrtj1eCC/asMJ/gA90LpcTamzcknSGDAe5l22CWWEPEj8Zyx2NyJhFS956r/QoRD3
         rG7AlQi5TfUraCgH2+RhO9164spnK6QWT098WzjYP1Ri2sCX9psIhfNRCiY49jnr1ESI
         qh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=fSmTGGISerpaaT9aJOrv4cy/yLYw7vFSX4krrCAu5wI=;
        fh=QCT0nYxQLXnJJ3ZUAkpm7r7CxvT/Ht1bCmFJUrbrHyQ=;
        b=q/3KIW+lIskPDga0D1Zxr+h9qcfFVKqs9PztZSm0QuZAdd0BernYQbG9RO+bghL007
         UP2IFUKswQx8l0mJl8kE/jSDgt8pL573wU6NHpzxZYOMtV7sD4OOa9x6hrvvKPMYU1/j
         ig5YB/94V+xxBDGbZByPWds33lkoK7On4F8/QBN2k6cfwogfdtngDBGP+ApDuBuX1vc9
         Gmr07IiEiqPv/Bn9PH1uML18nopR9egv41PzbRTEOFX2vpmO3hBoCKc+eF2WZgHVr9SQ
         947KxX/ZMyXLc/XuzdNRBdzSm4bNGpjWvH01kT1UP4Y7fawq2wIIQVG3O+iE6gZpT374
         JCRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e36-20020a0561020fa400b0047c1bf3e87dsi2257798vsv.691.2024.04.30.07.01.36
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:36 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-XAulONQ1MVehUCfwq5nNCg-1; Tue,
 30 Apr 2024 10:01:33 -0400
X-MC-Unique: XAulONQ1MVehUCfwq5nNCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2F1F1C4C394
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EFAAB20296D2; Tue, 30 Apr 2024 14:01:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FC0020128EF;
	Tue, 30 Apr 2024 14:01:28 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Christoph Hellwig <hch@lst.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	devel@lists.orangefs.org
Subject: [PATCH v2 07/22] mm: Provide a means of invalidation without using launder_folio
Date: Tue, 30 Apr 2024 15:00:38 +0100
Message-ID: <20240430140056.261997-8-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

Implement a replacement for launder_folio.  The key feature of
invalidate_inode_pages2() is that it locks each folio individually, unmaps
it to prevent mmap'd accesses interfering and calls the ->launder_folio()
address_space op to flush it.  This has problems: firstly, each folio is
written individually as one or more small writes; secondly, adjacent folios
cannot be added so easily into the laundry; thirdly, it's yet another op to
implement.

Instead, use the invalidate lock to cause anyone wanting to add a folio to
the inode to wait, then unmap all the folios if we have mmaps, then,
conditionally, use ->writepages() to flush any dirty data back and then
discard all pages.

The invalidate lock prevents ->read_iter(), ->write_iter() and faulting
through mmap all from adding pages for the duration.

This is then used from netfslib to handle the flusing in unbuffered and
direct writes.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: Miklos Szeredi <miklos@szeredi.hu>
cc: Trond Myklebust <trond.myklebust@hammerspace.com>
cc: Christoph Hellwig <hch@lst.de>
cc: Andrew Morton <akpm@linux-foundation.org>
cc: Alexander Viro <viro@zeniv.linux.org.uk>
cc: Christian Brauner <brauner@kernel.org>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-mm@kvack.org
cc: linux-fsdevel@vger.kernel.org
cc: netfs@lists.linux.dev
cc: v9fs@lists.linux.dev
cc: linux-afs@lists.infradead.org
cc: ceph-devel@vger.kernel.org
cc: linux-cifs@vger.kernel.org
cc: linux-nfs@vger.kernel.org
cc: devel@lists.orangefs.org
---

Notes:
    Changes
    =======
    ver #2)
     - Make filemap_invalidate_inode() take a range.
     - Make netfs_unbuffered_write_iter() use filemap_invalidate_inode().

 fs/netfs/direct_write.c | 28 ++++++++++++++++++---
 include/linux/pagemap.h |  2 ++
 mm/filemap.c            | 54 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 4 deletions(-)

diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index bee047e20f5d..2b81cd4aae6e 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -132,12 +132,14 @@ static ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov
 ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
 	struct file *file = iocb->ki_filp;
-	struct inode *inode = file->f_mapping->host;
+	struct address_space *mapping = file->f_mapping;
+	struct inode *inode = mapping->host;
 	struct netfs_inode *ictx = netfs_inode(inode);
-	unsigned long long end;
 	ssize_t ret;
+	loff_t pos = iocb->ki_pos;
+	unsigned long long end = pos + iov_iter_count(from) - 1;
 
-	_enter("%llx,%zx,%llx", iocb->ki_pos, iov_iter_count(from), i_size_read(inode));
+	_enter("%llx,%zx,%llx", pos, iov_iter_count(from), i_size_read(inode));
 
 	if (!iov_iter_count(from))
 		return 0;
@@ -157,7 +159,25 @@ ssize_t netfs_unbuffered_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	ret = file_update_time(file);
 	if (ret < 0)
 		goto out;
-	ret = kiocb_invalidate_pages(iocb, iov_iter_count(from));
+	if (iocb->ki_flags & IOCB_NOWAIT) {
+		/* We could block if there are any pages in the range. */
+		ret = -EAGAIN;
+		if (filemap_range_has_page(mapping, pos, end))
+			if (filemap_invalidate_inode(inode, true, pos, end))
+				goto out;
+	} else {
+		ret = filemap_write_and_wait_range(mapping, pos, end);
+		if (ret < 0)
+			goto out;
+	}
+
+	/*
+	 * After a write we want buffered reads to be sure to go to disk to get
+	 * the new data.  We invalidate clean cached page from the region we're
+	 * about to write.  We do this *before* the write so that we can return
+	 * without clobbering -EIOCBQUEUED from ->direct_IO().
+	 */
+	ret = filemap_invalidate_inode(inode, true, pos, end);
 	if (ret < 0)
 		goto out;
 	end = iocb->ki_pos + iov_iter_count(from);
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 2df35e65557d..c5e33e2ca48a 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -40,6 +40,8 @@ int filemap_fdatawait_keep_errors(struct address_space *mapping);
 int filemap_fdatawait_range(struct address_space *, loff_t lstart, loff_t lend);
 int filemap_fdatawait_range_keep_errors(struct address_space *mapping,
 		loff_t start_byte, loff_t end_byte);
+int filemap_invalidate_inode(struct inode *inode, bool flush,
+			     loff_t start, loff_t end);
 
 static inline int filemap_fdatawait(struct address_space *mapping)
 {
diff --git a/mm/filemap.c b/mm/filemap.c
index 9a2e28bf298a..53516305b4b4 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -4134,6 +4134,60 @@ bool filemap_release_folio(struct folio *folio, gfp_t gfp)
 }
 EXPORT_SYMBOL(filemap_release_folio);
 
+/**
+ * filemap_invalidate_inode - Invalidate/forcibly write back a range of an inode's pagecache
+ * @inode: The inode to flush
+ * @flush: Set to write back rather than simply invalidate.
+ * @start: First byte to in range.
+ * @end: Last byte in range (inclusive), or LLONG_MAX for everything from start
+ *       onwards.
+ *
+ * Invalidate all the folios on an inode that contribute to the specified
+ * range, possibly writing them back first.  Whilst the operation is
+ * undertaken, the invalidate lock is held to prevent new folios from being
+ * installed.
+ */
+int filemap_invalidate_inode(struct inode *inode, bool flush,
+			     loff_t start, loff_t end)
+{
+	struct address_space *mapping = inode->i_mapping;
+	pgoff_t first = start >> PAGE_SHIFT;
+	pgoff_t last = end >> PAGE_SHIFT;
+	pgoff_t nr = end == LLONG_MAX ? ULONG_MAX : last - first + 1;
+
+	if (!mapping || !mapping->nrpages || end < start)
+		goto out;
+
+	/* Prevent new folios from being added to the inode. */
+	filemap_invalidate_lock(mapping);
+
+	if (!mapping->nrpages)
+		goto unlock;
+
+	unmap_mapping_pages(mapping, first, nr, false);
+
+	/* Write back the data if we're asked to. */
+	if (flush) {
+		struct writeback_control wbc = {
+			.sync_mode	= WB_SYNC_ALL,
+			.nr_to_write	= LONG_MAX,
+			.range_start	= first,
+			.range_end	= last,
+		};
+
+		filemap_fdatawrite_wbc(mapping, &wbc);
+	}
+
+	/* Wait for writeback to complete on all folios and discard. */
+	truncate_inode_pages_range(mapping, first, last);
+
+unlock:
+	filemap_invalidate_unlock(mapping);
+out:
+	return filemap_check_errors(mapping);
+}
+EXPORT_SYMBOL(filemap_invalidate_inode);
+
 #ifdef CONFIG_CACHESTAT_SYSCALL
 /**
  * filemap_cachestat() - compute the page cache statistics of a mapping

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

