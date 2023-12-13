Return-Path: <linux-cachefs+bncBDLIXLMFVAERB7EZ46VQMGQEIFQBLYI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BD2811664
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:49 +0100 (CET)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b9ec958b81sf8540995b6e.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481148; cv=pass;
        d=google.com; s=arc-20160816;
        b=LKDcZGaHpGc1DLUY4wleCM8YyjbvLWsjJBmxX+6faqmEl71X806zn6OwJEc6DXCNXI
         QDayADN0rVgs/k9qJGgbLf9fIL9Afe78Rf2SNZwTeyCngowfCw2POSzw6mm1vj5clB77
         /pjFZFG1YBfkwdgKUDcwcTJczD06oxLLjiTKueQGemvE4OC4RWpoPz9AewtDgKYQ7tVp
         IvN4csy98BuCH5HPAv1BVnK4QpOdDyilCgs7jBAT+BXd/q6a61AKkavhiRVMN57PmdsM
         gVcyBbfVoU3059G3n/usQVHtDUiiRJzoe2JiK/eA30XPKrWtskZsiXiDJwXJFL9g381v
         AtDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=VtPmJNG6iC2M+KMuTeCA4f3Gu0u7SITmnR9d0CD4u4g=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=FKehpIvU326KjIheM6skBElr+yUotXYx+pnZgICpJswhEEBO/QLAWbawWxquQoSk8P
         PeZITm7uw8dJwiD730BQ+FtAEFzeAthmdUoJccdfDuZLBsaE8lROYeibYzeO6HwjbTTY
         BGPDJHrGc/vXYZkvNS4k3z9WexT2UbggceWwWJY5eNaIzmlUi8ZdXyfcNHOtB+K5phpS
         JvmZymj/uuDRHZEsy1zaX0awWg0R8M4pXzfYmkU7W+orplMyQaS+HxgRgaTEKPoAxP2p
         0tlLOOnbTmEZHsJauZ9qJAdlSb188nNDht4E39rkTbzW7+R+D5FBEEgXYoykSTv3fiGf
         9/Rw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481148; x=1703085948;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtPmJNG6iC2M+KMuTeCA4f3Gu0u7SITmnR9d0CD4u4g=;
        b=PIM1uRXw3n4H2V7CdOXQZomXuWgSo9F2uG3MyMDuz0z5/FPVV6acH/UnZXRNJ8Wk3h
         0DSCh86yQTRo/9ey8fa1K37JE9xrbJR5cXD/KXnkv6ML8f3PiZiZG3DnIwjibQ0m+HF6
         NcXBhHAXFWrFAWUCZN5Po+JjGsjVacrPAtIuiDEBbX0FDW8V/FPv4t5bv4+lsqkfuc7e
         Y0TjdTUsEL/9aXfbk1rIDjQFjgM5eAI5w+lSG8WE6HozYS5heiVfKcABAFWAEXseS4mh
         GsBRi86716aw+dz1WD0ldQB8XAW27/Cb1AzpmypX6+u+pkdPi+Id9+t/vTE832mW/XC7
         KUhQ==
X-Gm-Message-State: AOJu0Yyvbx0oslJx7rEK1VSYsBuusVSJmYS4QQwTog7FX5GE1PRUFO6P
	+hfM8lOrk/xF/P0uPMNDzrQCEw==
X-Google-Smtp-Source: AGHT+IHsMyQEVjMZDgVTsMKuM+2PmBwLxnJ9uZttBRjM/f5MF5nJ8eUUaxNt/5I4OrwJguo+xVp+wQ==
X-Received: by 2002:a05:6808:1a1c:b0:3b9:eec3:925b with SMTP id bk28-20020a0568081a1c00b003b9eec3925bmr10201012oib.77.1702481148441;
        Wed, 13 Dec 2023 07:25:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:423:e09f:e8dd with SMTP id
 s36-20020a05622a1aa400b00423e09fe8ddls7891888qtc.0.-pod-prod-04-us; Wed, 13
 Dec 2023 07:25:48 -0800 (PST)
X-Received: by 2002:ac8:7d0e:0:b0:423:7c65:e4df with SMTP id g14-20020ac87d0e000000b004237c65e4dfmr12230084qtb.14.1702481147881;
        Wed, 13 Dec 2023 07:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481147; cv=none;
        d=google.com; s=arc-20160816;
        b=SoYFz2lg9y1x1vAKyif5a6tu5estGX2p/ZlhbEHBlkvNORQTa2QisBe+JQ+/wMTPAe
         K5YWKChlLg935koY4TD7mCloDIO+2mpuV2SSAA5sSpl0JnANsYAH02t9plgN3WACXMtC
         UPVWAQ9Y2W3+OVM8qYJF9YYIAFjR7BRWzb6oBAtO8lKwRdRRSofNCvEowMKAH4JF65/W
         WkJu2d3Xs9A205O84855L4x4wirTmgma+JdOfLfZnivC1hzuGNH52p7Wlj03Mv9XplVl
         IK0QfYOxo9N1RZKtd40VAmJ3LH2pDPtkgR+aVcqcFbPc2d6HBSlIdIvxSgHNIi+eNlZA
         OZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=n7vsxkTeFDyw/Xz/jQpnFttohdwf2WdzS8Vx6FHSJ3Y=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=WIdW2Eh4cfQs0vo/uplG0zH+HpdFAEwfMyuULTOkAiy9E5jXsRt2KJWkTvkVFa+QfZ
         a0YLjSsSIOrwnkrE7TG6AcPD5vaxgGwdgxEhwm5DlFUX7487zJad5zCIaOFWReOJbVuX
         0Rh3DjR+TQt1iet0B80OXVkNALUXFgGgLL0XqXTQ/rCDbzpTNcLWtL04K5COe9SiGdJU
         9Ymjp5L8cI5+Fg1iJCfG4cReo8iphlMKnGhkhyUEKZRqC/VS9jorsVYMp7+afvBySlRQ
         FpOtpP6J0fMKKQIYK90R0bQlD6jqIhoCPiQfHIpNcQ6U0PinwHf+V+aaTHVknz1rBUv/
         kX0g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id h14-20020ac8584e000000b0042547c95362si13480868qth.531.2023.12.13.07.25.47
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:47 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-_2tLVZ1oOmi4TYoFhmSWGg-1; Wed, 13 Dec 2023 10:25:46 -0500
X-MC-Unique: _2tLVZ1oOmi4TYoFhmSWGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC92E8828C9
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E83701121313; Wed, 13 Dec 2023 15:25:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 718511121312;
	Wed, 13 Dec 2023 15:25:42 +0000 (UTC)
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
Subject: [PATCH v4 26/39] netfs: Make netfs_read_folio() handle streaming-write pages
Date: Wed, 13 Dec 2023 15:23:36 +0000
Message-ID: <20231213152350.431591-27-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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
index 73a6e4d61f9d..950f63fc156a 100644
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
@@ -87,6 +88,15 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 
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
 
@@ -239,6 +249,7 @@ int netfs_read_folio(struct file *file, struct folio *folio)
 	struct address_space *mapping = folio_file_mapping(folio);
 	struct netfs_io_request *rreq;
 	struct netfs_inode *ctx = netfs_inode(mapping->host);
+	struct folio *sink = NULL;
 	int ret;
 
 	_enter("%lx", folio_index(folio));
@@ -259,12 +270,56 @@ int netfs_read_folio(struct file *file, struct folio *folio)
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
index 8308b81f36be..082a5e717b58 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -118,9 +118,11 @@
 	EM(netfs_folio_trace_clear_g,		"clear-g")	\
 	EM(netfs_folio_trace_copy_to_cache,	"copy")		\
 	EM(netfs_folio_trace_end_copy,		"end-copy")	\
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

