Return-Path: <linux-cachefs+bncBDLIXLMFVAERBM5Q36VAMGQEXHTZSAQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id B15047EF976
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:36 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-41cca916954sf29255351cf.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255795; cv=pass;
        d=google.com; s=arc-20160816;
        b=nAgfxdc0hnPRACr++OSOzhE9hc+u3gNBgshoC+/RIWz/LrW++GtuvFWtjFUsBFlQTq
         7zTHdEk74NyDn4o05z+BnvX2bBw3EEdxkNOrIQhf65523PzjkSrl9aP29aw8lhj7Xid/
         E91clwKIh3hCZUFNxu816qHxy+jAknuxEGy9IwxEh0PadfFDxFIoKo2vLQhFrNlKwFhQ
         HUc7/uff2D++gE4wSPcEDgLW/5mWOFRb/Clr2UlooH9YsIw39DR45ejA8F5eNhxhiuL7
         aXQijQnFUsXBy9utLiC2+hucDYNMayvFGxILivb7jd5JtLKSGP1h4pBOzK82u4U3G1C9
         ySFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=oL/f0qCM+4Mre1UR0TrmtkLQS8e92xKGAJRIk7CwR7E=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=JRK2w6UuZFmgBpoz8kuIl4SKd8rYzALcgSHkHPZ15ujw0Y14ith87U7slSTkcap9/K
         n8zjPdXKlpQroTLvkGt5vaFqVIlbTgCSWnBZ7BL9ZTz6x7w4u612VA1PsJhl4AqeIh8L
         aMJ0UDLYE9o4SfvzzsGQUCVN4dJ6+x9XQUaQuCCKURAfyFNGuqW7TkVpW+GqgFVTkYDk
         eBYfi6xkTpFQJhUzXOsajsFVRTRogt4adsXVuyf6wuV+13LNxi7CWwu0/UNfk4eWI0k2
         mXiNGWuGpChQq6hZf7/hDIkYL3B0tAk8wUflvUJ4uFccKHtbOtcJ/iu4YDEa/QRwUYQN
         c9uw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255795; x=1700860595;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oL/f0qCM+4Mre1UR0TrmtkLQS8e92xKGAJRIk7CwR7E=;
        b=JgoFSufa/CS/MyzJ5pFqtxbxQJjbbX8a49+le+lr1FyBtdT8GAsEHrvgfM++fFAVnE
         qijnOjgPsJLFGMIy4Vjt/zYOxtEvla7XTvKWVKhhlF2Er1o7QiBt8Y632nz+OpFYMEWU
         nTu2FV67+8IYUb8PphQyTZhFCsRFMM/o21oZpfux9ixbgSKKwxbq+1fUtlu9e+Zzq/bW
         sm9wo/UGJuTfZOUaGDdf2DRCZwedGTFyzqsovbSFEADvF3+EoB6aa1XhpdQLtlxYkRMc
         qdQtpSZK27C8Ms6ahPFjsrnkvwmcU3o4er/ynbOFmeRBqwkk7VXy7r9bO+S7MDoBHC7I
         HGFw==
X-Gm-Message-State: AOJu0YzWey+EWU/h3sbYfde1BpoXPHMxsqMkOgkLMHLukbO0U5zfGZHE
	60tpoPnly0dKC+mJ0v99PWK2bA==
X-Google-Smtp-Source: AGHT+IE9a9mPUDZvQ7B4g2XdnFyMNGQTHVnVZD1WINvrbMyWMHkPyWNjiDjkCNtolWCh8lmPp+VNLQ==
X-Received: by 2002:a05:622a:44:b0:41c:cd2a:f05a with SMTP id y4-20020a05622a004400b0041ccd2af05amr940840qtw.25.1700255795718;
        Fri, 17 Nov 2023 13:16:35 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1a1b:b0:41c:b790:86d1 with SMTP id
 f27-20020a05622a1a1b00b0041cb79086d1ls1364819qtb.2.-pod-prod-06-us; Fri, 17
 Nov 2023 13:16:35 -0800 (PST)
X-Received: by 2002:a67:c113:0:b0:45f:b975:f717 with SMTP id d19-20020a67c113000000b0045fb975f717mr797047vsj.34.1700255794972;
        Fri, 17 Nov 2023 13:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255794; cv=none;
        d=google.com; s=arc-20160816;
        b=bLtj/HdcF5S219V7qV17TIbqmlltpmd3LGv5ITYq5qZ2tPDZTtW0wfnMu/sbf0Ffqo
         4G4lze6vx65i53B2F/s6PClINLH5ehQ74ofYr+KaIia9MEK4IZYQ9CE0noEajfFPOUrs
         DLgA+Pn+6uGS5Hwu8GPhABZUDlp1H/Qgmprl4xKhQKasd4+yXJ+5u+nNw2aEg9GDo7pE
         5mtINNHigrI/ensNzL3jY+eaq19I2xHCQc9hmSkPsrmJv19hZDABq0YhvSlS9GkV0Kfb
         G48gCPhqo2hH1iVr3Wibi5GYoUqy/xNcXilWks0Sm6w3+XAQuao8j+C8msvwMYwvGF0z
         q2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=aymUqh8tNqy/9mbxQPB2e2M5NzhlTlDvAtO1iWjEkMc=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=VQ4hQCKUOPxsc+aMtrau3GZ6NSfDRC/bjZfg+xOPwrJtMxdLX6ugPx7eSfVbK3veLi
         ueMRObgma2hCBkh4ZGE2GsDnQ4U0KpJpyd9qi4vM9uu5etgTaI6z5UV8nnx2I7kvsA2e
         lImDzuEPcY1qLlwFnGuBT8ECq6Zj15O9FzOGWoSVDlf+qtrP5XJY1muvpGwsZ1pgaFfK
         Pd3okdlCIwHSpYyP5Rcm31F+cAifiq0rYb/Dc6xC1P9unw2aX2HWOJmMXW6sMBNoNj4A
         zQRJ3J/rtJLqrF8ytkr7QUppFuLbGwMduxeYky0GFr3dwzvlN51PuRtciPYysNH0Ew4I
         wQGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id p9-20020a056102200900b0045f542d1498si654050vsr.368.2023.11.17.13.16.34
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:34 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.81 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-563-c3PKLz2WPouokFHMoTwj0g-1; Fri,
 17 Nov 2023 16:16:33 -0500
X-MC-Unique: c3PKLz2WPouokFHMoTwj0g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26CCC1C0636E
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 23BEA492BE9; Fri, 17 Nov 2023 21:16:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 863BC492BE0;
	Fri, 17 Nov 2023 21:16:30 +0000 (UTC)
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
Subject: [PATCH v2 13/51] netfs: Limit subrequest by size or number of segments
Date: Fri, 17 Nov 2023 21:15:05 +0000
Message-ID: <20231117211544.1740466-14-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.81 as internal address) smtp.mailfrom=dhowells@redhat.com
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
index cd673596b411..20ddd46fa0bc 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -163,6 +163,7 @@ struct netfs_io_subrequest {
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

