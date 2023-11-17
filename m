Return-Path: <linux-cachefs+bncBDLIXLMFVAERBL5Q36VAMGQEJEESYQY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1787EF974
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:32 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-66d24cdf232sf28326446d6.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:32 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255792; cv=pass;
        d=google.com; s=arc-20160816;
        b=I0noM+0FH9fhRM3ka97XWGgcs2N40ZoUtft1kHWSRSQw61GgfaNZ4vEIU5mPyLSlRH
         D5yCpFt+VqhNztNIUK1PpdrYplhYI7ZuhNf1gdt8hVngFpqvCCDUMVz2dnjq9zzrALXF
         DkRP8kCTXNy0hGmH7bpt1bINTgXUbYlTzvJIYHxf+xT0c06k8aLkz3VSWp2LFB7COriv
         ykwyuw1P3SxZX7oIu5au76mBDV8xAJ9B+zDFFl0HaEobHy1dPVUac4gtDcfQmhrjfv3Q
         c2ZYkaYykyFi3q2UEdFqQ/XpWn0q6v4AKwTSPxkcgxNu+PbCNRelqi6XEfdubevkTlL+
         sLWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gcitzqcuFS7mi6srEqTPsVpb8qY+ugAHkY/axBynZlo=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=XLKet7kv5ngGrm06+5oSMAFMpygeSLuVRzndQ+aGMjnzBH6hXY+PWwIdE3+adw+4kC
         PdnYLxHuK3yw9l4ZUWRfGa2lYBCbY5rEvpMDAlCAwmx9kO7aZ6HJvuz7x0Sey8q3dSmF
         Nf4u6dWXKX1uL2HB7VibWiHINNA5epp8DGzffwAOlniuAVKvbyRLkNOyWdPpvGEpf6ed
         9GpPhItDcrbf34YO8eMK1xA6AwQX8NMESBFGMvtapSBjMSDZDAIj9lsZW1WiItSwv6C9
         duvVNv0mq7ZMcZa/pgGgRDZPyOoWaUJVEwvtYOr2bC73mtEKbN79zBQ26X7NfDMU3wIF
         6DjA==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255792; x=1700860592;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gcitzqcuFS7mi6srEqTPsVpb8qY+ugAHkY/axBynZlo=;
        b=eo3gHgClfOgq3lMQPtWGffzRQFM1CXLtO0IBKKsuqAqRQhlSmTTyFwC549S4FnE5eG
         LgqeYVUl29sT/hDl6FRkfCB0fSz7ZODTrKR5J86SO8rJuCulXx6k3gnbPmiYRkDOqunN
         t9DH1GDcJ+fRP/V0ruJP0WZEMq1zL7yCodlRlPZIwZugCjJJwdnaUCSdlq9Boy8FWVCI
         J5d3DZ+h01R01/DdNWSuw4B3nf1Or26lgaVUKwjDIlx298m6YJ9dZkkl7qm8GCKwmmMm
         jFycAADwkTL/jkydbPbbOWRUbQOr06gSb0sQ9Ca8U1mdOWFx/VDM99M+eWSRz92iwuBu
         4Law==
X-Gm-Message-State: AOJu0YyVYxa+iRnej4Zi5gvQoXFc5hUegtreSjR16m9TJR78vPxb8pbC
	7xcHS2od8ia/tXB9E/p2epcHyQ==
X-Google-Smtp-Source: AGHT+IHhK3fFDpWKBU8CMVrYi+UtJeAfRzfkjCsUE3bR+svqlt5fySUMohWi2tBV0n3+7hRyXcHPOg==
X-Received: by 2002:a05:6214:5294:b0:66d:50a6:da72 with SMTP id kj20-20020a056214529400b0066d50a6da72mr303871qvb.26.1700255791955;
        Fri, 17 Nov 2023 13:16:31 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4c02:0:b0:65b:1c2b:3bb0 with SMTP id bz2-20020ad44c02000000b0065b1c2b3bb0ls898029qvb.2.-pod-prod-06-us;
 Fri, 17 Nov 2023 13:16:31 -0800 (PST)
X-Received: by 2002:a05:6214:5294:b0:66d:50a6:da72 with SMTP id kj20-20020a056214529400b0066d50a6da72mr303855qvb.26.1700255791460;
        Fri, 17 Nov 2023 13:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255791; cv=none;
        d=google.com; s=arc-20160816;
        b=FP0MkxjlQPrOpKJwVfcoSj3zQ0iDoBL6/9hdS3YSdcwyliznqxi9A5Kur64C7sMP6U
         jF12UkTqoZ+gvDiKdR7We9/6uM8tAQsBL1Q4AZmbF7bSA8ZOPSUAZSI9dPS6pQ53EIfk
         tKcenHhyowUbaYc8mhlStt/esyB3jMOQbDJusZ7qxIJXr3JdpEWwuWvBaBRMZiuoyPb1
         9bIm0Qjmfueh/oBuXWtXPRvWySe8wWKIKc6aUFgGrGhS96Ap3iSOpvY+AZr/MCYV5uIC
         HdoPg6mEX6hBtfgZ/qa1O7nBiXs8JNvIML3vFIZZk3yE6fhbJGRWMIPyn5RX8ki6KLgn
         xO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=a+cTmaciv8sFXDtNEzB6xtMwFyjcuJcgPFS5oMA9nmQ=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=wOs35qg4OuEof3g6BMA68/kr/JQiYfLYTZDx2UlyGC0HnlxLuhkPgwVcSoAKynp1wc
         jbqfiJOo4xVfilRfd6L2ODCtHCgwq470ntf1KQlTAfo5s1r6MIo0HaPWV3GSogFk0XKx
         y3VCMGTZKsFJ73YgRoOrcS5myhdneODBbjj3nr1lEwmb8ZhzCRL1cfjzR1vEstCMc+ik
         Y5wdnKVz+nWBfC1S2hQWhAKj9sQ63Kawuakmn6HpwNKw2BJUEyDMpKAOZhZc8LuAp/Po
         XMgFnJElG/VEFLl3XXw6AC96KW93RevV2CkpbCWeTtS47o3FnRuH7kabHKsfi9GIL5O0
         DXrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id e15-20020a0cd64f000000b0066d28ec81edsi2353447qvj.36.2023.11.17.13.16.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-XUni20EDNauOhNzVvNcWnA-1; Fri,
 17 Nov 2023 16:16:30 -0500
X-MC-Unique: XUni20EDNauOhNzVvNcWnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C08D5382135C
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id BC57E1121308; Fri, 17 Nov 2023 21:16:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 267A61121306;
	Fri, 17 Nov 2023 21:16:27 +0000 (UTC)
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
Subject: [PATCH v2 12/51] netfs: Add func to calculate pagecount/size-limited span of an iterator
Date: Fri, 17 Nov 2023 21:15:04 +0000
Message-ID: <20231117211544.1740466-13-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Add a function to work out how much of an ITER_BVEC or ITER_XARRAY iterator
we can use in a pagecount-limited and size-limited span.  This will be
used, for example, to limit the number of segments in a subrequest to the
maximum number of elements that an RDMA transfer can handle.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/iterator.c   | 97 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/netfs.h |  2 +
 2 files changed, 99 insertions(+)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index 2ff07ba655a0..b781bbbf1d8d 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -101,3 +101,100 @@ ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 	return npages;
 }
 EXPORT_SYMBOL_GPL(netfs_extract_user_iter);
+
+/*
+ * Select the span of a bvec iterator we're going to use.  Limit it by both maximum
+ * size and maximum number of segments.  Returns the size of the span in bytes.
+ */
+static size_t netfs_limit_bvec(const struct iov_iter *iter, size_t start_offset,
+			       size_t max_size, size_t max_segs)
+{
+	const struct bio_vec *bvecs = iter->bvec;
+	unsigned int nbv = iter->nr_segs, ix = 0, nsegs = 0;
+	size_t len, span = 0, n = iter->count;
+	size_t skip = iter->iov_offset + start_offset;
+
+	if (WARN_ON(!iov_iter_is_bvec(iter)) ||
+	    WARN_ON(start_offset > n) ||
+	    n == 0)
+		return 0;
+
+	while (n && ix < nbv && skip) {
+		len = bvecs[ix].bv_len;
+		if (skip < len)
+			break;
+		skip -= len;
+		n -= len;
+		ix++;
+	}
+
+	while (n && ix < nbv) {
+		len = min3(n, bvecs[ix].bv_len - skip, max_size);
+		span += len;
+		nsegs++;
+		ix++;
+		if (span >= max_size || nsegs >= max_segs)
+			break;
+		skip = 0;
+		n -= len;
+	}
+
+	return min(span, max_size);
+}
+
+/*
+ * Select the span of an xarray iterator we're going to use.  Limit it by both
+ * maximum size and maximum number of segments.  It is assumed that segments
+ * can be larger than a page in size, provided they're physically contiguous.
+ * Returns the size of the span in bytes.
+ */
+static size_t netfs_limit_xarray(const struct iov_iter *iter, size_t start_offset,
+				 size_t max_size, size_t max_segs)
+{
+	struct folio *folio;
+	unsigned int nsegs = 0;
+	loff_t pos = iter->xarray_start + iter->iov_offset;
+	pgoff_t index = pos / PAGE_SIZE;
+	size_t span = 0, n = iter->count;
+
+	XA_STATE(xas, iter->xarray, index);
+
+	if (WARN_ON(!iov_iter_is_xarray(iter)) ||
+	    WARN_ON(start_offset > n) ||
+	    n == 0)
+		return 0;
+	max_size = min(max_size, n - start_offset);
+
+	rcu_read_lock();
+	xas_for_each(&xas, folio, ULONG_MAX) {
+		size_t offset, flen, len;
+		if (xas_retry(&xas, folio))
+			continue;
+		if (WARN_ON(xa_is_value(folio)))
+			break;
+		if (WARN_ON(folio_test_hugetlb(folio)))
+			break;
+
+		flen = folio_size(folio);
+		offset = offset_in_folio(folio, pos);
+		len = min(max_size, flen - offset);
+		span += len;
+		nsegs++;
+		if (span >= max_size || nsegs >= max_segs)
+			break;
+	}
+
+	rcu_read_unlock();
+	return min(span, max_size);
+}
+
+size_t netfs_limit_iter(const struct iov_iter *iter, size_t start_offset,
+			size_t max_size, size_t max_segs)
+{
+	if (iov_iter_is_bvec(iter))
+		return netfs_limit_bvec(iter, start_offset, max_size, max_segs);
+	if (iov_iter_is_xarray(iter))
+		return netfs_limit_xarray(iter, start_offset, max_size, max_segs);
+	BUG();
+}
+EXPORT_SYMBOL(netfs_limit_iter);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 0bc90c4035a2..cd673596b411 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -326,6 +326,8 @@ void netfs_stats_show(struct seq_file *);
 ssize_t netfs_extract_user_iter(struct iov_iter *orig, size_t orig_len,
 				struct iov_iter *new,
 				iov_iter_extraction_t extraction_flags);
+size_t netfs_limit_iter(const struct iov_iter *iter, size_t start_offset,
+			size_t max_size, size_t max_segs);
 
 int netfs_start_io_read(struct inode *inode);
 void netfs_end_io_read(struct inode *inode);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

