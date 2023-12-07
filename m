Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQPPZCVQMGQEC7JU4LI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2980935C
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:14 +0100 (CET)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4258a2540cesf14581361cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984193; cv=pass;
        d=google.com; s=arc-20160816;
        b=YhQZ5DjQbA95laeBkH99eOKfh72IR5LcdhrG1C5czD84Q8L5FcFd7VcRf+ill5dMw/
         w5X+M6tP4MBiPlPRy4PmXIQCTJPL/b0TceJZug6ncl06hL4Trg90GRowM+JW3nFQGAuS
         KAv2QXpB03sSiyaNSc7l4iHe6ww5Ou1xqZ6Cud60/7IPH5D9+7f/ohGMVGOXJgrsPbiq
         RS5wVor/cQhQ/TcaqD8+TUnfev+judtxnTY9mlXpHmY/MVzLgGQ/GXAGwmrhgjC/lQUj
         m203qa/0bZ6HCpRTA8WjR0OCxgh3+QiOBPUfoMdlOnaeRjTnKp1eH9ZiuNHAil4+6L2O
         kznw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=rqudpaSzxN8ydN2c/UJ3SBXCQiFh59fmK/ZX7g6z7QI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=T3RsypG8Ok+pCL98mqNQ0JgKizEsPODlmTLQuKxpyfXzvvJATbKWHqdtXEr69j6I1V
         OZZxUyyE1nTCSLQZBk/E5nSVKBBw95NFvu7Ob+A2tEdpoEkeAQP5dOqmm2zl1eTcw961
         K5TdUdE98GZZApSh0zJmDU9PVAQnH8BwSPddf/i0XUrNtXdAP9peocn2xoLH+5qf4Uvx
         GuJyaM4+cePevV65zDkX/Enw0pqNaZVuhhHsoVO96syGXnY79FuT8mHxrfjPKVUjzSXR
         LehTd8I835suIcx7N2fC9j9HQeiC7vv/EnPMrhlSRo7EDdMeUa/uj6e/IOnJtBulnzDt
         7kCg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984193; x=1702588993;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqudpaSzxN8ydN2c/UJ3SBXCQiFh59fmK/ZX7g6z7QI=;
        b=XW/S+fkXLy1RlxVXiiaEwK28YJufyvhq7CpKD5vu9kYttdw0xMY8XAfxAxe+JsD+O8
         JMODYtvF/Lt9eWXT9kE7uv0c5Gd3CRJh207z0G8dh+lle+svOWDKlASxSpl/uGLPdElT
         GJgntTkadhSqD66MK3UUqPh1Iewv9fEYdFebC9zcluAbG58lvd5dNbgqxZ3oQaZ9KX6q
         OuvFNJ50Oqz3IpicuMio7KcvhA9phFbpHzK7VXlLP9Zj+xSEqWV0CqeXQs714jE67c5E
         P4KE+7nAtoo5q4BaSDDAqeyThdt1N+GyAn34ZUNpox4XxE28BKIj2UHjXhRt11Y5cuSd
         rsyg==
X-Gm-Message-State: AOJu0Yxc374Brk5TrMxiW3hZr5sStZp7Sg3iJhpuknE9ROFv2g6UEWZA
	0rd/e+19//GsuMXy6t43kBN5KcFfC/ckLQ==
X-Google-Smtp-Source: AGHT+IHHM0T62qG+PliuajrC+07Le4E+uDjKKCpX3gjMh6UWV48aJPGYliL/Yv+737eSzX3iRHtvFQ==
X-Received: by 2002:a05:622a:1454:b0:425:8fb6:5f74 with SMTP id v20-20020a05622a145400b004258fb65f74mr1710838qtx.34.1701984193701;
        Thu, 07 Dec 2023 13:23:13 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:4e:b0:421:96d0:ef42 with SMTP id
 y14-20020a05622a004e00b0042196d0ef42ls1418287qtw.2.-pod-prod-01-us; Thu, 07
 Dec 2023 13:23:12 -0800 (PST)
X-Received: by 2002:a05:620a:19a8:b0:77f:1947:64f5 with SMTP id bm40-20020a05620a19a800b0077f194764f5mr1787447qkb.148.1701984192647;
        Thu, 07 Dec 2023 13:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984192; cv=none;
        d=google.com; s=arc-20160816;
        b=r4+wIISpzzx92eghJCOL7/EXzsWuTxGmcleUI2szRIJ9AQpOlJoQEQHmRQVGAeTSvE
         uKzd4CIMUioG37I2phcpR0OzuiyLz8ZCsoEpWj3fQ6tqZr7tUg3CkqbuC85Hgwex4Uyl
         abWv5YfNjm8IsFNndfbQdSUYSFTAA4Jcqrx9rHVrOejfmFCsmCFEMEQxCS4eHAFc3JIi
         ddphzddaUbMMa6i1K3y0h0Snp1lWUjFD0gWgEKIOBeUKvk5RPEIvPYv/h5bOCB3rVMct
         j3JSpuquYLw+zlVDh7qw4yOame7GYykCGTJ0J73LboMOtSuU/Y2VI0Ild35AwP7npyNP
         NZUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YJNYoDwT7ftU812GMv/DOgXVSH8Cj0I5WKRdeJiGu3I=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=oL8ET5+27EboZzzGPebRfKeiAprUCpd4fG5atI0iH1I10vn5ebBOBRlNKWDOBq00HS
         GSz9dle3Fok5I35lwD5+MWIPm+PT877ANYvmV0nxfk9deRYgiZuoB7HR/5KB5n00H2oN
         +YH9XBoeKyuW8UgH7Raq6jonqKwXHs5KeWrkJOE5Q5mISePMRxO1gZjG1JRd8jwOEUN1
         MHybbpfCWNOW9lbL5oFA8Ol09ReJpclg2dMNqoGoYxsEUr5Z5C3T57GNtuBU+VUb+TDt
         zFAcTPnpNHUkiqxTCvB3EQWUMNsl5SleexJzAU79Px4SVz6/TnFwH3TRCRaqSkJuk/Bv
         b4Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id dw28-20020a05620a601c00b0077592c3366esi634291qkb.329.2023.12.07.13.23.12
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:12 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-569-Ye0SFH6vOOmnlJ4ataiQJg-1; Thu, 07 Dec 2023 16:23:11 -0500
X-MC-Unique: Ye0SFH6vOOmnlJ4ataiQJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C31ED185A787
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id BFE821C060BC; Thu,  7 Dec 2023 21:23:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 25C831C060AF;
	Thu,  7 Dec 2023 21:23:08 +0000 (UTC)
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
Subject: [PATCH v3 17/59] netfs: Limit subrequest by size or number of segments
Date: Thu,  7 Dec 2023 21:21:24 +0000
Message-ID: <20231207212206.1379128-18-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

