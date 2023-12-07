Return-Path: <linux-cachefs+bncBDLIXLMFVAERBP7PZCVQMGQEBEPNTVI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id A3404809358
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:12 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1fb2b365ecbsf2466203fac.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984191; cv=pass;
        d=google.com; s=arc-20160816;
        b=y8nIBvI1LasYd3w9N5E0NFNZ0OF4+W8xew5+dHUsMfBql370HG9wHNWEvDFxXXooY1
         pZ0hfOOPKzISzgV6ICx22OqGwMDpi7JnitpKbgQ/ESpSG0OoUCqLrsXNadf4B11+0HBW
         RWmk/uMJ0lkg8Q8JG/bsHIa+tNQPFMO0kTlYYHLfjNeDHVij7DzdLR16ACC8YER/w9BJ
         R1YZp2i7m8gHolHCrqyL6ertnK3IijBRC20Ttg7fKI/MxkuNcp90QC+HAndtHpwKiCDm
         GuD6/5fZfDE2gnoCbDiBicYSsMrNundxklTiT2cs0qxaMZOre9c62CalRxZKGjs91ZV8
         v1Kw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=B9e84crUarhjiflgQAXm42xDNocoYu7MSYxRXz3HXyk=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Lg8OZs4cMWSXKjbgkPNxM5GQP4vfGIXmgZTMX+AXEWHDFinbwBU/YeIO5UJmlRgOyB
         SAGJJARopnMDvA66aEKBi8LEoXxoP5+cD350+RILtTYJOutPHiamNWTtKVp6qFUiuclr
         Ap8LMxY5Hsp8Q1gIKikjp0IvhjGH6HcG9MLe83R8WCt0hlYUR7cWpItYOg/QLQ29iM0R
         OVPALVH5V3V7QkLVx3Abt075kDrYo/GkPMUpjPufKtmXRGd4s5USeuJJruffa4WswsTK
         /KIvB6xzHIZIzmgOeC2cKJEgAz3CzL87p1Budnrsel1ZsVXU1OL3MVrM7lUL8rKo2D7/
         H+hg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984191; x=1702588991;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9e84crUarhjiflgQAXm42xDNocoYu7MSYxRXz3HXyk=;
        b=hoIqPyZnAMgPoMOL1ALGLoIcA6XHxIkxsA4/tlTmmx74u6Ilzw8+J87MIE1thJ05Aw
         BAkFzLvgZbRiCHxDPiDT3etB0hR1KkLFyfCsaqyh0AgdxZSlXpC3DdNQi1W0Ju3Kxslb
         e3+ORbINx4PO2ayQ+WnoqAh2AROCMObNIPXWZ33MBDuZOAr3arAgFYB1Wr/oaWCFMHSO
         gcqPnh4A2bHg44/LkNnCfkMHPGfG1rjv/RqwgrN2ErQAWwAFy900BCUk3c81SgrVCOxf
         gcM4QLyL2qM4Ouc6rID3TPcMQaz1LHEYM8ikJ4V8Nlyt9o0cIcBnH6n07eISd20RCH8O
         gbnQ==
X-Gm-Message-State: AOJu0Yy90t0vT7UGrjz9KPq4HfISvk40Bo71BBqUBe0uKKRoPDJMzgAV
	6WXnArl5V/fQJLrmB8nYaDwTXw==
X-Google-Smtp-Source: AGHT+IGc/okGAzSznaskxHg/LaUwsnpIjqMp2b/uh2UuKWJT675bBB4bsZC73m+WY1XzNuK21Zrgyw==
X-Received: by 2002:a05:6870:b52b:b0:1fa:e8ec:8a2 with SMTP id v43-20020a056870b52b00b001fae8ec08a2mr3461588oap.57.1701984191483;
        Thu, 07 Dec 2023 13:23:11 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:7b54:b0:1fb:1d02:1209 with SMTP id
 ji20-20020a0568707b5400b001fb1d021209ls1415384oab.1.-pod-prod-04-us; Thu, 07
 Dec 2023 13:23:09 -0800 (PST)
X-Received: by 2002:a05:6808:638f:b0:3a7:330d:93da with SMTP id ec15-20020a056808638f00b003a7330d93damr3288414oib.19.1701984189418;
        Thu, 07 Dec 2023 13:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984189; cv=none;
        d=google.com; s=arc-20160816;
        b=IBp0wilWja3d1Rj071tiuEgkX7VFT/eM/E7Kbj0UOWXJm+RDSGsOtJ0ykLOX5u2t9Q
         4l+bF1ngM7CQhZVwoUVlZW+9xUdiAJRRfxJrLzTZL4hlHoeIIOoiUDC2+fRlY2nNHQd9
         iELqSZPe3jeBxs7ISqyWqFYrnAB8PJ/jyet0RemugB8fsBOGl+BQycGZeyhsHj7DwNiU
         2SzF8Ky7rDMd6P3dZ00M6fbTEet3i4yOxLylVcjdnWvTekrbKfIH4QqmAVC2f9zI276i
         gKbXfO2Uq2TZkVKSoWa1pjiHTRy5bRwW80kJvntJbOPPm6W/QWndqWSUNc0Cbm9nDvfu
         skrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kDE/M1RbzgmjQWasqi03vRWSNjlBlYY2O7ZHPetmOEs=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=diI2jN8w9srJNUyYJfEjR/nuFVGPnifYInnILlA31ry99bU8x/mbSbqXgGnHqo7J1+
         zJNr7uRSB/QA6IeIxLuvpEuzCNo5kQ8zpauTdX8S2tCig2Blf8RecGCvLH/Ct3mDJDJW
         LPtu/eXVcrenQTPma2BuWbvfItJhE21XzvNiA3yVlgeS/zq9/xN0yJbpowXnyCdDReRC
         Jrv21FbQfHVNUwP4I/VuF7qE7QIqYEjEqOQN9KgZFSwXieEe98G1NBz9YcLUiyYiQQvG
         jkUk4Jz6jMFQDQlExPLrKUJ05SjfA3vQJJx8G/dLJmPCJ3/wBJLHC1+RXTPcUShu6+ii
         cn/A==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id eq20-20020a05622a5e1400b004195716fc55si759598qtb.711.2023.12.07.13.23.09
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:09 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-418-4lYfJ_PvMjWsw2by7Kz-Fw-1; Thu,
 07 Dec 2023 16:23:07 -0500
X-MC-Unique: 4lYfJ_PvMjWsw2by7Kz-Fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8177E3821351
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7D5E7111E404; Thu,  7 Dec 2023 21:23:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC13B112131D;
	Thu,  7 Dec 2023 21:23:04 +0000 (UTC)
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
Subject: [PATCH v3 16/59] netfs: Add func to calculate pagecount/size-limited span of an iterator
Date: Thu,  7 Dec 2023 21:21:23 +0000
Message-ID: <20231207212206.1379128-17-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
index 8a5b8e7bc358..a30b47e10797 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -324,6 +324,8 @@ void netfs_put_subrequest(struct netfs_io_subrequest *subreq,
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

