Return-Path: <linux-cachefs+bncBDLIXLMFVAERB3FQ36VAMGQES2XLROQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCB7EF9A2
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:17:33 +0100 (CET)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-6d2a5a99311sf2232987a34.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:17:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255852; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y4JNFXEZrjABqwGJzKMfcSwIZZl3sM7tYNH0h3bejhYxUWrIyJigD0EcaG5CzP6nDU
         nSPTAapgi2noogg42WtyOyBWWamAKpD7jJXNsMR+HDK6vlH2uqxpt1y3/HUda6egqcAB
         Lil5ZmZOeCKWRuVXjCEcxUH9LfqsoOrhf3FfKfvyBukhWtqIpqbFNyTtsa8tvjaQRtnv
         TIxkFHu4ycFlS6EEF4l8Bpngr6V3/GDNkJmaM/CpQJfPpByhjJ3r7X0OCtAqrjNpAnUA
         pa0fL/Zf4AF2hzNQRPECAw+Zgi12oW3F3UIZYyQkfPFcVW+2H/43RpD9ZIQIeniffpK4
         9O3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5ApWAQZI/OLYEpqRo7QWW3vIMPcKry+pvwtfnn7c2SI=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=LCsGnZOErabmat5K5M/PMFZ3myEmUwZ2UmSCi8LKoZLN0KX5p2Jc9+NHFKHGYbWpPm
         o3XrGU7zfts0K3Lbs4VqAirT2AXlO4ws19tIPNJNkpw3/BDlpO11OSa+diwK3CDm+YVq
         2FSgQ4f0gY6sEy9SiwE2/JI5JOhptcqKkUENioKFtAmwRv+z47QFxFyAkeYuGAMv9CMq
         kaPRNlSMZwK2hyA3o2uNSNHsTn2F6OegBmierJnaKPRN9xf6jup5mQrrsSGRA7JWM22J
         /zA2dp+nH7xi+8JE3EwGkXVvzlO4HzJvzhKpA7XimnplBl9igkuJV0e2P7cLBYYwT+rf
         eegQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255852; x=1700860652;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ApWAQZI/OLYEpqRo7QWW3vIMPcKry+pvwtfnn7c2SI=;
        b=SXzJun1t7uyBzKeD9paSPQPQI1hOQUfIm7U909UEykFU6s0Z7C6DY3iyIe7hEYCq2x
         jk7m6mzec++OwdAafTEDVGGu4LdPOeYblxKXmqfIgGMdtPaA8r/NpYtsb2jyfeLxhhGF
         vfiLI7PX7AF07gt2cW6hDaGvKq8DlbpnW24um69JsYt68FvwCguZqojYsFBccyOOsWhG
         8BwYZSLVNj6d/eiYJvlx9yHq9qInk3qDce5iab+X243eQlQlhdxWtIsuCPA1P9Gj+13Z
         IkgU/bZyruyv3zMzCs2oQzSy+VDRV7kd73pyNVGF8UBvhbblsGDmE8G7GGbq/Ne1fVLD
         9P3g==
X-Gm-Message-State: AOJu0YwaF0tSqKfIF84pLLNm30wEVhaxVZ/4ymgu96jMJ5L8+cdntWpG
	95YaELR4A6/hvnMi3mUXwQuiMw==
X-Google-Smtp-Source: AGHT+IGsHe8XAw1pQErvSftkJlml3artBJ/PYmr5RI+5WhbN1UO1exTNYN5NY7//zGNaBiG4pVSfMw==
X-Received: by 2002:a05:6870:1b1b:b0:1f5:acf2:fda4 with SMTP id hl27-20020a0568701b1b00b001f5acf2fda4mr516945oab.50.1700255852247;
        Fri, 17 Nov 2023 13:17:32 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1909:b0:421:96cf:8514 with SMTP id
 w9-20020a05622a190900b0042196cf8514ls2207554qtc.1.-pod-prod-08-us; Fri, 17
 Nov 2023 13:17:31 -0800 (PST)
X-Received: by 2002:a05:6102:3be6:b0:45f:32ee:1c1d with SMTP id be6-20020a0561023be600b0045f32ee1c1dmr819842vsb.19.1700255851748;
        Fri, 17 Nov 2023 13:17:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255851; cv=none;
        d=google.com; s=arc-20160816;
        b=h0LOVZlnesY/hHxvP+9Dty+Rx4XarRAqePwTOwU1uL03EWwz0lLZVPoDKk04zsQJkA
         dbtvwilZyiHM/mKm/C/XXTg4DiFPNfIW1QaSktb/cPwdh2uf7yxb6r8TMvlv/ml2fmq/
         1suXrgw9ryOebNm0VbVrZjSWRjtEaVQQ3/Qvj1w8UIA5YqfraxnyVZ0ya/9voGsY/3l3
         6rR6Oc8mHLgrrQVDpy04cvTI5ctMZXifHk4fXrFNY8EK1/rnO8b4aMj5W+sBztGZJHBx
         ClZW09pr9CjAGm6/9WqMHiqfS1TPMiLceUT8Gq1rzcTd2crRoE+YJ7XgpsMhh/+PZbfQ
         u5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=28kgPZMsHEWnVwc0vT6VK3Ue5Bj5q+rjSv2U7JFM+9k=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=il2ATzeuORmeWY4LREilVU0IzqlphMdApmsZB/crISu9pLPi6Y9SmDMe++CCnYrtOe
         de5mcAtYd808pc4QOp4vOhdYrmiKeG9//f3kQ1Vj0TqGTt08Z8SuDHk5xijZNHwqqpgA
         h1+0Y2hWTJvS0lk+ZbwFO99jY6AN5n0KAVwy4nBfqI6TyC+Uh68cWT5T6gWa+C+34nG0
         1I0CmGUZz1cugJTKh3vzvrpuN0nF6r6PO25oRr2BkM26prJAg+XGfIeeJgXCZEiwlCNV
         A97/HcolP8KOq047IY70DT7GOqnjs6f34vpvYnNRdVpFbVXMYWCn3LA+QUw/MZAPzpTl
         MiTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id j10-20020a67ef0a000000b0044d4f2fae15si633169vsr.22.2023.11.17.13.17.31
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:31 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-_GYR5U_qMUGobEYDSLc16A-1; Fri,
 17 Nov 2023 16:17:26 -0500
X-MC-Unique: _GYR5U_qMUGobEYDSLc16A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C40C1C06529
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 58A472026D6E; Fri, 17 Nov 2023 21:17:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5C232026D4C;
	Fri, 17 Nov 2023 21:17:23 +0000 (UTC)
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
Subject: [PATCH v2 23/51] netfs: Make netfs_read_folio() handle streaming-write pages
Date: Fri, 17 Nov 2023 21:15:15 +0000
Message-ID: <20231117211544.1740466-24-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

netfs_read_folio() needs to handle partially-valid pages that are marked
dirty, but not uptodate in the event that someone tries to read a page was
used to cache data by a streaming write.

In such a case, make netfs_read_folio() set up a bvec iterator that points
to the parts of the folio that need filling and to a sink page for the data
that should be discarded and use that instead of i_pages as the iterator to
be written to.

This requires netfs_rreq_unlock_folios() to convert the page into a normal
dirty uptodate page, getting rid of the partial write record and bumping
the group pointer over to folio->private.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c     | 61 ++++++++++++++++++++++++++++++++++--
 include/trace/events/netfs.h |  2 ++
 2 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 2f06344bba21..374707df6575 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -16,6 +16,7 @@
 void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 {
 	struct netfs_io_subrequest *subreq;
+	struct netfs_folio *finfo;
 	struct folio *folio;
 	pgoff_t start_page = rreq->start / PAGE_SIZE;
 	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
@@ -86,6 +87,15 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 
 		if (!pg_failed) {
 			flush_dcache_folio(folio);
+			finfo = netfs_folio_info(folio);
+			if (finfo) {
+				trace_netfs_folio(folio, netfs_folio_trace_filled_gaps);
+				if (finfo->netfs_group)
+					folio_change_private(folio, finfo->netfs_group);
+				else
+					folio_detach_private(folio);
+				kfree(finfo);
+			}
 			folio_mark_uptodate(folio);
 		}
 
@@ -245,6 +255,7 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	struct address_space *mapping = folio_file_mapping(folio);
 	struct netfs_io_request *rreq;
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
+	struct folio *sink = NULL;
 	int ret;
 
 	_enter("%lx", folio_index(folio));
@@ -265,12 +276,56 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_readpage);
 
 	/* Set up the output buffer */
-	iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
-			rreq->start, rreq->len);
+	if (folio_test_dirty(folio)) {
+		/* Handle someone trying to read from an unflushed streaming
+		 * write.  We fiddle the buffer so that a gap at the beginning
+		 * and/or a gap at the end get copied to, but the middle is
+		 * discarded.
+		 */
+		struct netfs_folio *finfo = netfs_folio_info(folio);
+		struct bio_vec *bvec;
+		unsigned int from = finfo->dirty_offset;
+		unsigned int to = from + finfo->dirty_len;
+		unsigned int off = 0, i = 0;
+		size_t flen = folio_size(folio);
+		size_t nr_bvec = flen / PAGE_SIZE + 2;
+		size_t part;
+
+		ret = -ENOMEM;
+		bvec = kmalloc_array(nr_bvec, sizeof(*bvec), GFP_KERNEL);
+		if (!bvec)
+			goto discard;
+
+		sink = folio_alloc(GFP_KERNEL, 0);
+		if (!sink)
+			goto discard;
+
+		trace_netfs_folio(folio, netfs_folio_trace_read_gaps);
+
+		rreq->direct_bv = bvec;
+		rreq->direct_bv_count = nr_bvec;
+		if (from > 0) {
+			bvec_set_folio(&bvec[i++], folio, from, 0);
+			off = from;
+		}
+		while (off < to) {
+			part = min_t(size_t, to - off, PAGE_SIZE);
+			bvec_set_folio(&bvec[i++], sink, part, 0);
+			off += part;
+		}
+		if (to < flen)
+			bvec_set_folio(&bvec[i++], folio, flen - to, to);
+		iov_iter_bvec(&rreq->iter, ITER_DEST, bvec, i, rreq->len);
+	} else {
+		iov_iter_xarray(&rreq->iter, ITER_DEST, &mapping->i_pages,
+				rreq->start, rreq->len);
+	}
 
 	ret = netfs_begin_read(rreq, true);
+	if (sink)
+		folio_put(sink);
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
-	return ret;
+	return ret < 0 ? ret : 0;
 
 discard:
 	netfs_put_request(rreq, false, netfs_rreq_trace_put_discard);
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index 94793f842000..b7426f455086 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -115,9 +115,11 @@
 	EM(netfs_folio_trace_clear,		"clear")	\
 	EM(netfs_folio_trace_clear_s,		"clear-s")	\
 	EM(netfs_folio_trace_clear_g,		"clear-g")	\
+	EM(netfs_folio_trace_filled_gaps,	"filled-gaps")	\
 	EM(netfs_folio_trace_kill,		"kill")		\
 	EM(netfs_folio_trace_mkwrite,		"mkwrite")	\
 	EM(netfs_folio_trace_mkwrite_plus,	"mkwrite+")	\
+	EM(netfs_folio_trace_read_gaps,		"read-gaps")	\
 	EM(netfs_folio_trace_redirty,		"redirty")	\
 	EM(netfs_folio_trace_redirtied,		"redirtied")	\
 	EM(netfs_folio_trace_store,		"store")	\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

