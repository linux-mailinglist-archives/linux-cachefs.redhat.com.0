Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOHZSCWAMGQEAUWXUUY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D5081B762
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:14 +0100 (CET)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6dbb33d3093sf920160a34.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165113; cv=pass;
        d=google.com; s=arc-20160816;
        b=e5PagRsVn/NrEmBM+7dDg5WfALa0vPSyNIJdLbWS7/vdbsG0PPfn6tLmP7Kaj/20r5
         uS8xIGx/2XDV0eo4Nv4KQCFJNePmJNqZuDfHZNd0GB3K9Bg9Q/C0UXO4NZEwMjJnj7x8
         zNrhncUBddnxz6Tw5Q2Tg39cOChkAHtG723xtVUcN2gqZK8MWjsx0E0/AIL7MkOKr9Df
         zUq5Yo2Qb4Pj+hbwnNH7ab3LiaZw8XzMVzwKGelVHdkxBanrAAfCGq/aW/24a6b2YMHb
         dtY3fe0OxS3rZx6xsnurnUtAdqRxyrrV/znDmEOVWGnqMOp62a1J+ziO6ndPlLHUK7jG
         ua3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=2jMjUoRY0+dmFk7G1SAF3JqdPQjfOf3jGHusVs2tHx0=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=fO75CVj/hIMPGbBUwKFtpt1B6lP+ZDdIlZ4NSB/YGE3eMpW3n1snI9If/29wtjNwAd
         phc6i0UtNHZOicLKi9IYAIrye3e6+3+3796mdUnDw/w+B5RTVipcWPbBtRH2OjTJLk3t
         niv6Ned7bAwfsInUJ0Gh0b6oV9d9aoKAxK5YJGqtf+e9RlGQOYiS8DOmjiINkdE52+7D
         kyUaPY7keHnzhjCLOmBtGL6RYC2yn4jC6QWu9mMqY/yDat4cDEkMCSyGpeKDU8TG0WrI
         nmbwwsmjnQZcRmpnO1rgG1rHYQVAXjutfZFU4sxloc6mCe+bF0nRzU8+J1nyIHuSxu0f
         FKNA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165113; x=1703769913;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jMjUoRY0+dmFk7G1SAF3JqdPQjfOf3jGHusVs2tHx0=;
        b=FRuU3xN1zu9j5wU/m9swdGf45BK8Dnm1AFECp4Q2BHZuJLWt2YIV6kd0jdGmnCXo/W
         3UnuO3sCT0qL93PgDfc0oqduP4s1DAqipD2TCSRATJ/zzIeqCzOTwZkm6zacHbAz1uAx
         NKYp7dwHZ1PEhWUDKK5qTrNQu3Y0bt6iwRiRWYwK6FyatfZwq1TOR3jbvAEh+urkX0Qw
         q0cH3fKfbVCRU6zmU5UF3gT/JDgfc67PpGrjbuX5sshGKtx++vJoNwuCO3A37Mgvsts7
         hgKM6iWvbZbyWUPWnGmyqzxDrUhRkcqGmbAxp60H0wHbk0bk+7O8f9kHOxMGcF+7VRjL
         V/eg==
X-Gm-Message-State: AOJu0YwphMVRVz96u7aCdVNZZ2OtrI8H4Dvu03HvcAvbSAKUoxuAzzcS
	bkRp/YG+L9QmJJz/iX8qkuKXqw==
X-Google-Smtp-Source: AGHT+IF7SY0CUDDPyRch3npB0s4wfrzA0zXush4t2H5AbuMYToVcNgguVHEYrfS51Goqg6gAW9/BCg==
X-Received: by 2002:a05:6808:18a8:b0:3bb:7773:76f9 with SMTP id bi40-20020a05680818a800b003bb777376f9mr1718020oib.33.1703165112908;
        Thu, 21 Dec 2023 05:25:12 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1bc9:b0:67a:b34a:6626 with SMTP id
 m9-20020a0562141bc900b0067ab34a6626ls1685139qvc.0.-pod-prod-05-us; Thu, 21
 Dec 2023 05:25:12 -0800 (PST)
X-Received: by 2002:a05:6214:1741:b0:67c:d743:3286 with SMTP id dc1-20020a056214174100b0067cd7433286mr19545036qvb.0.1703165112377;
        Thu, 21 Dec 2023 05:25:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165112; cv=none;
        d=google.com; s=arc-20160816;
        b=k/EWiX/Awl3N0/wzncLsB+6DymA+3nTko6Sg4oytyU2V/qQv9fhL7Y7/2PVT4UdftY
         BN/Ymw0iFchWF30m11rypUTBPGm4KScJfVpQtYPMvB1ioGrnTMIcQfNQldHsR46c7gxD
         ggzqcE1XzGooJ72Fg3K55zFGVSP+6irYUpxlJ7DXSQkKSc0cNmiQm+w3nN/hqIBmREOc
         dhg1qZIKdbAULkGJQ60Xq82nAHI1qoS1Q0ApwfGqjIVe7XG6YfEXba9Ct0m4cjZn1maX
         r37BqQq/eaHt0bsR+LK9TdsynNZMPItSjlxcOM/A9CYIUhcsE9J5wuF8mG3mAOnJUQX3
         b5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=/UF7ncNYwO6Zmwpre4ch58LPX02xE0uGtdq+3Y5EMaI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=lGI4VOwePqzIoBWMj/6B6Fy7ncnV/QBwe8lWqyzqvOT+3Jj1VHDYPXdIAdbtsxA5hB
         dUgv59DEWEb/bMfdvRSjiLsGez0KNnVO3IDdNWqf3o48GqWdC8VAmLc7LCtsUTNh6WKT
         e43C775CEW8EVGtQCfW0ZO+mwruhUQ4bM5mhykjGhd2Yqx/gNMjtG8l8F3M815gervDz
         WGZX39s6pIyDK8ghhNIncQfCx9/vfmFweZS1xho1vrtoe4MJ1m4XtfrTZNsrcPyuMuIr
         1BEoAAQP4yx4V9FuMoaP0YbccbfixOlz+QozoqTIxL+gCxnqpp2WwLT+pSEV/PCqOWCb
         SA1w==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id n17-20020a0ce951000000b0067f7fb095edsi1986434qvo.177.2023.12.21.05.25.12
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-2DvYaj0qN_i0v0hBNqE1TQ-1; Thu, 21 Dec 2023 08:25:10 -0500
X-MC-Unique: 2DvYaj0qN_i0v0hBNqE1TQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8C54185A786
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A52A940C6E2B; Thu, 21 Dec 2023 13:25:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 735EE40C6EB9;
	Thu, 21 Dec 2023 13:25:07 +0000 (UTC)
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
Subject: [PATCH v5 17/40] netfs: Add func to calculate pagecount/size-limited span of an iterator
Date: Thu, 21 Dec 2023 13:23:12 +0000
Message-ID: <20231221132400.1601991-18-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

Add a function to work out how much of an ITER_BVEC or ITER_XARRAY iterator
we can use in a pagecount-limited and size-limited span.  This will be
used, for example, to limit the number of segments in a subrequest to the
maximum number of elements that an RDMA transfer can handle.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
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
index c05150f51beb..41d438e5d6db 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -322,6 +322,8 @@ void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
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

