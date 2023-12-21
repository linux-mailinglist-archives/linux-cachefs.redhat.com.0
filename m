Return-Path: <linux-cachefs+bncBDLIXLMFVAERBPPZSCWAMGQEFXJAUSY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 531AC81B765
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:18 +0100 (CET)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-dbcd9f4396esf1153951276.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165117; cv=pass;
        d=google.com; s=arc-20160816;
        b=s0eDWDSYPa4nvWDe8t9iZELBSBhWNBaRmtwblZEW42gkErt1XjqdSTSl/cHu0Zp3Gh
         j/yRFQn782yM64FIeRxKXrKZaF/F7xMt+nAJ2cX6YRCw8Ex8sEVDm2o8JCcp1dXz9za0
         1IeAOAPTAOWg4X+cecLs6L4kvl1ClK3De2gSAfFcHAEAJ8G7NT6CX9PkgrJ7CBJAYLhP
         F6Snu+S3DaWMFEe1defTZTdnwIKIbMg8/OMIkuiUCCud+52JS0nF3b9ldiKtzanjwiki
         /d/V/nggBgwjmEPcdtlIyESRZvngx3pnZfIX68aD4/H3nGunDgE9RMce0zu1Ymk5/kTI
         cpHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=up/9Dvgfisv7dQckOls1jxT7Z5zz5GGQ1emVqvS/P8Y=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=OUxc9Kfqu8zNdVdY29aBWQFxewgr9J3qd5Vfx3Czvh5qmpW2bf+TOtH2hzNsebPQQ0
         j2tVUhl3uIqO6ES6kbn7scZVIRjC+0p1EPJKtoiOmim07JhhJfakxGUaEHWOsIErS+Pq
         y3zEDpRmZMCELXOhQWs1YZBCky4kWkBJOBCb70yrbpTi85f4ua8I/jI0tePvtiR0P1Rj
         oQOUhHfzssqchZHUjpVo2dgQ4GZHqR9bmDYHOYWhpNRmJ6m1GrMeCp7E7wshCyumW2fE
         szCHRWfJ+PXE/fKty20oIsAP46sKayjIgSzhEo6D9Jam8DMjL8LNd3FSyZ3uGIbjKkiN
         97+w==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165117; x=1703769917;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=up/9Dvgfisv7dQckOls1jxT7Z5zz5GGQ1emVqvS/P8Y=;
        b=Tp+iLAi5lwjFW6TjErPsiioCysbAgDtlTLgXqTgfAm/BAYGyWVTRB8XrovUU6VHMjz
         6sp/CX+f3dXjU2LMbjcqTG8X8YUiEDErL4Hmlptq4Go6WCI33aa+uvaNQ1JfArxQRln/
         9RxpwQ6Zb7rxQ7t8FWRQcQbdCXO7zrJmqMj+IDlN/mxuZJxCw8KkHi2l7fSx6dZn0tTR
         TycqgujZUAWhkSOcohhtGMpF3GnXt5rkQwkygrQPBhLLX+TGfFZIyoYZ+bBNCfLpxQ/t
         Wbe1ULMFqxmf9YJopQMmmWsGsWYwbZ7sINODMHlp7XfZXRopaupBCIRuT1aucbeC2Gaj
         IRjw==
X-Gm-Message-State: AOJu0Yw05NBxTY2VvSQTJN2x73tKZ+ERTJdnuEHDTSK37TjeK+iOfl5H
	NdGYHBKmplJGAtkt4Z4tW3iemQ==
X-Google-Smtp-Source: AGHT+IH93M+2WQYMh7ezoXWIX1oNUo3J5YSx31llwrDcCezngxkGcrZp8f1AoYI5Q6WcXSYOjJ7dHQ==
X-Received: by 2002:a05:6902:18d3:b0:db5:4bb1:36df with SMTP id ck19-20020a05690218d300b00db54bb136dfmr1465833ybb.57.1703165117273;
        Thu, 21 Dec 2023 05:25:17 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1811:b0:427:9ac7:4744 with SMTP id
 t17-20020a05622a181100b004279ac74744ls1024030qtc.0.-pod-prod-09-us; Thu, 21
 Dec 2023 05:25:16 -0800 (PST)
X-Received: by 2002:a05:620a:46aa:b0:77d:c7fe:76d8 with SMTP id bq42-20020a05620a46aa00b0077dc7fe76d8mr29199648qkb.11.1703165116687;
        Thu, 21 Dec 2023 05:25:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165116; cv=none;
        d=google.com; s=arc-20160816;
        b=CKNGhtdHg55RNy0i+FFq/6PLEwQAc5Q7SYT9QcdzLCnQD660ttdoUiSNqUri4XyKe+
         8iPDVODq5OINYRDcQf/E0zTiiyFvHmqu620jK/fijfmOyDmR1oFybGLrKMa9f4b8OvHS
         HZWi4rxP644lFDCXw0Xp592/KFfMc8MAz+XLcqdaXs7QMDKKq2fAz2ZRdlE6sWx4I0kF
         Gp/bovCqblv8vbN044KkFHxo8IWUfwIurk6aUweb5Pucsw4Bae1PYtvzU3NkOcXIddxo
         G3fmZxLLafVuH8ynBHOysPAk48e9tMcgKJJNVovMxxqoQC94O1BNNuX26MacszR0JLWi
         MVSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gAK2p2qAWIcg9pxgbQQ97/VBoelCZmAI70KqBDTKmoo=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=odymD430yTDMv4NkJ3Gm29rCv9meVJ+TrXnG5hoQhS7mAKwQyuwsyFUf+kHCkF11Es
         +RFlCQjiE2Fym/RNtO8Olpw/ySyJIB3N7Tfmr1EPgbCicNVkxhi+d36QE3+suKq0FlfP
         EBdHJaKzJ0+4fS5j3jyBYp/YIr38nZk7+Q8BkKu+Hd7T3ZEd+H3WQ7s2tAE0ZbiAUkEQ
         HG/dSnMm1Gqd+I17w6CDxcG90zpg8Zpv6TYhPBlJnWYxG/ELhuEp6WT2voY6x8nqGWug
         QoEKB1TEB6GZOqLjGldbj73trImT0hlOKTbzoHA0E5VKRSVmqVQdTnuIxyuytUzLQA02
         aBMA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bp39-20020a05620a45a700b007811615ef4asi2299624qkb.740.2023.12.21.05.25.16
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:16 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-92-I5ufjV9VM1GdZ8JVymBAPQ-1; Thu, 21 Dec 2023 08:25:14 -0500
X-MC-Unique: I5ufjV9VM1GdZ8JVymBAPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 46076185A780
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 422552166B35; Thu, 21 Dec 2023 13:25:14 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 585BD2166B31;
	Thu, 21 Dec 2023 13:25:11 +0000 (UTC)
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
Subject: [PATCH v5 18/40] netfs: Limit subrequest by size or number of segments
Date: Thu, 21 Dec 2023 13:23:13 +0000
Message-ID: <20231221132400.1601991-19-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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

Limit a subrequest to a maximum size and/or a maximum number of contiguous
physical regions.  This permits, for instance, an subreq's iterator to be
limited to the number of DMA'able segments that a large RDMA request can
handle.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/io.c                | 18 ++++++++++++++++++
 include/linux/netfs.h        |  1 +
 include/trace/events/netfs.h |  1 +
 3 files changed, 20 insertions(+)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index e9d408e211b8..e228bfb530ea 100644
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
index 41d438e5d6db..2ece21fccb02 100644
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

