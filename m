Return-Path: <linux-cachefs+bncBDLIXLMFVAERBVMZ46VQMGQECAQQQYQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5FA81164E
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:10 +0100 (CET)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-dbcc6933a14sf1440513276.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481109; cv=pass;
        d=google.com; s=arc-20160816;
        b=W9u64IwaoziiSRsEyirnXVKqMYriAhOcQuhqX4qXqYGRalRCOfpqKYrnLvTMRrXGDl
         J9FJQ0ptfTFqGL5v6l064aQnrhUB8YQgMxPTQsZx5CA5BCoUhPrJKKL192YZU73qIfQC
         TOLm3HVY89nGBRjnpf8t1/moGZZdLUIaeqjF04jXHb0/R+boJ/Cn8iYGWDPJ9+O0wPhv
         ktj4M5g4zmcMrOcH31/aI7ehjfWTRiCgYaviOcUMedrL86QrVQspqlrX/lfh+PHrC8Kt
         m3/4OU66lGB8Ue18WnSg56em9GQvak+E4Jw1g0eazv2o0JFCx+q8TzH+vDzVXo0/dQCX
         x0Sw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=rqudpaSzxN8ydN2c/UJ3SBXCQiFh59fmK/ZX7g6z7QI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=QpaHd4Bf2E4W3heXTcXcnuNrk5xnVzL8142YjGvM8XRXYuPTjH87Gmj5vVKEH6gPmV
         7QXAYlhD9VQKzCVxS4L8DxeN/WZOM9YrEg7cZnDnfWFtRJjpEYHwtA6xtmp0PledIs8J
         A/5kkOOoPXbbzbBrGsk0omY0UxUtL/X0jYPyTW2Cs23KtO3PxxoBPx1f9x8B0xtZRJq9
         RBcH2wUr5Kk0o3q+teBNNjeiX2YdPtcuhItt67tovv5TVGedAewA0HsoU05hzf63u9Z8
         bi+wJRE3seUpdlvGbYGNRLkSxcE2RzvIP8B/LsjwqBjdu3hVb+SSYeW8scQ8xSbck+NN
         /HRw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481109; x=1703085909;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqudpaSzxN8ydN2c/UJ3SBXCQiFh59fmK/ZX7g6z7QI=;
        b=IJ3f/akbmEnmJ98VE8nG/8uGQwceg0Q4hasb83JDDqpq8QZs/ALMwYAB0inAgtsBxS
         SiKBUt9D6Wv9I/JNY+f7UDGc6ciU/jcEVfaUPRGqtoeEBIf4WzyH+9sDTdkoH/lQwSqW
         6xXeUVrtBWBtH9FPVNf/Lzq/n7P93aZ9obcaWVVijgzyd0f++prIx+cOdfqpHqKDd/y+
         4LJZxvCIJsbL3rR2FtXoQecP9WbZ8bD3xUOsxZOTbPL66ZttKOF2M2QaWfKjSj2ayUdy
         oDGnbLxRegvB9AGdsdr96ndBOgYnjUj+Z3n9+8vs/kN/Pg1nnKhUDXvObXUeg7X2mAIn
         8rOg==
X-Gm-Message-State: AOJu0YzVlUEWNEDtLnWwkuZ8BqMtP94WlkWfwSBiAKp9Kwx1I26yzkKw
	lyVaQd/44bmnKyYjG0/XQpRJvw==
X-Google-Smtp-Source: AGHT+IFE6rFlb899cVcDAP95IEfQeDwdG48M1bfogRGlewl9bv8A4Bts1dNmXO1i9P9cXk/G9NaiTw==
X-Received: by 2002:a05:6902:1aca:b0:db5:50c0:b0be with SMTP id db10-20020a0569021aca00b00db550c0b0bemr5660059ybb.35.1702481109416;
        Wed, 13 Dec 2023 07:25:09 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:8602:0:b0:daf:6c11:349e with SMTP id y2-20020a258602000000b00daf6c11349els440743ybk.2.-pod-prod-07-us;
 Wed, 13 Dec 2023 07:25:08 -0800 (PST)
X-Received: by 2002:a25:fc20:0:b0:dbc:dea7:19a8 with SMTP id v32-20020a25fc20000000b00dbcdea719a8mr83521ybd.121.1702481108773;
        Wed, 13 Dec 2023 07:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481108; cv=none;
        d=google.com; s=arc-20160816;
        b=RCRN/astKjobgdRWsHIndkRi8Zvtqu51PeaXuKYj5C8TqHHkM+1LcnVV0N9rMldyzD
         TD1cyYxXW74yzH//xLmCtqMzyhtCqzDMqw95XkVBNzCFfmeMeJJIqqMM0wzT58mn+Y2h
         /NYinNDYaFNbG2a6YFmmiwQQNqUsAEDCcUOewXf4U5/IX0ipNxxrA8KEL9jggs8o9zUw
         7lVoqWNGg7n1F4Z2vOrPN4pU0JpUgDKQz+jAnryhm7v7QIDTryPAivfR7P4dpSOYYbgk
         r55kH4oJOED/tI3fXhR4L88mipV7jCasWSL61Ru4ohF6uVxQ6zz5ycfrkAAD5tY06oRZ
         A03w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YJNYoDwT7ftU812GMv/DOgXVSH8Cj0I5WKRdeJiGu3I=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=N1ZvjvYBT2i/IF4q7uSaH9L/ljNJ8F+NFxKiPBYy7ihT2jZQtukKsvf+spsgL6K2E7
         9hTtWdk+gWSqIfBKjEx0WZA/mE+oKyN5b0/U0NsADSeYX1SW1hy6QvG+vwj7xJGAPveA
         fHudeaTSbxSRUaSB+pFjEmXZRuNOuswkcy+m7Km1SflnMtQJvkUezbXtaiKPYqmz/o7V
         rcoAGFJnPfd89Ou/5EW6rAaW9x35FTeH7EhTlz7JQmSbc8dIK14j/r2REzD5kZ7EwpOz
         eS9kLKZ6zOOmEOR7mU0JyuV6p42RAEP9Ph7kG2U2DWZ3nzf+NyYJfMye6s3k4cL2WgD+
         X8kQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id o18-20020a67f492000000b00464a1fdd715si2327728vsn.395.2023.12.13.07.25.08
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:08 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-Kx2_W7NiMQWQgwT2R84qBA-1; Wed, 13 Dec 2023 10:25:07 -0500
X-MC-Unique: Kx2_W7NiMQWQgwT2R84qBA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5C1788FA44
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:25:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id D2FCC492BCA; Wed, 13 Dec 2023 15:25:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FA05492BC8;
	Wed, 13 Dec 2023 15:25:03 +0000 (UTC)
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
Subject: [PATCH v4 17/39] netfs: Limit subrequest by size or number of segments
Date: Wed, 13 Dec 2023 15:23:27 +0000
Message-ID: <20231213152350.431591-18-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Limit a subrequest to a maximum size and/or a maximum number of contiguous
physical regions.  This permits, for instance, an subreq's iterator to be
limited to the number of DMA'able segments that a large RDMA request can
handle.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/io.c                | 18 ++++++++++++++++++
 include/linux/netfs.h        |  1 +
 include/trace/events/netfs.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index d8e9cd6ce338..c80b8eed1209 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -525,6 +525,7 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			struct iov_iter *io_iter)
 {
 	enum netfs_io_source source;
+	size_t lsize;
 
 	_enter("%llx-%llx,%llx", subreq->start, subreq->start + subreq->len, rreq->i_size);
 
@@ -547,13 +548,30 @@ netfs_rreq_prepare_read(struct netfs_io_request *rreq,
 			source = NETFS_INVALID_READ;
 			goto out;
 		}
+
+		if (subreq->max_nr_segs) {
+			lsize = netfs_limit_iter(io_iter, 0, subreq->len,
+						 subreq->max_nr_segs);
+			if (subreq->len > lsize) {
+				subreq->len = lsize;
+				trace_netfs_sreq(subreq, netfs_sreq_trace_limited);
+			}
+		}
 	}
 
+	if (subreq->len > rreq->len)
+		pr_warn("R=%08x[%u] SREQ>RREQ %zx > %zx\n",
+			rreq->debug_id, subreq->debug_index,
+			subreq->len, rreq->len);
+
 	if (WARN_ON(subreq->len == 0)) {
 		source = NETFS_INVALID_READ;
 		goto out;
 	}
 
+	subreq->source = source;
+	trace_netfs_sreq(subreq, netfs_sreq_trace_prepare);
+
 	subreq->io_iter = *io_iter;
 	iov_iter_truncate(&subreq->io_iter, subreq->len);
 	iov_iter_advance(io_iter, subreq->len);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index a30b47e10797..406d5a3a3298 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -161,6 +161,7 @@ struct netfs_io_subrequest {
 	refcount_t		ref;
 	short			error;		/* 0 or error that occurred */
 	unsigned short		debug_index;	/* Index in list (for debugging output) */
+	unsigned int		max_nr_segs;	/* 0 or max number of segments in an iterator */
 	enum netfs_io_source	source;		/* Where to read from/write to */
 	unsigned long		flags;
 #define NETFS_SREQ_COPY_TO_CACHE	0	/* Set if should copy the data to the cache */
diff --git a/include/trace/events/netfs.h b/include/trace/events/netfs.h
index beec534cbaab..fce6d0bc78e5 100644
--- a/include/trace/events/netfs.h
+++ b/include/trace/events/netfs.h
@@ -44,6 +44,7 @@
 #define netfs_sreq_traces					\
 	EM(netfs_sreq_trace_download_instead,	"RDOWN")	\
 	EM(netfs_sreq_trace_free,		"FREE ")	\
+	EM(netfs_sreq_trace_limited,		"LIMIT")	\
 	EM(netfs_sreq_trace_prepare,		"PREP ")	\
 	EM(netfs_sreq_trace_resubmit_short,	"SHORT")	\
 	EM(netfs_sreq_trace_submit,		"SUBMT")	\

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

