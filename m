Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLFQ36VAMGQEZGCM52A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E67EF96F
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:16:30 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-587a58f3346sf2320908eaf.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:16:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255789; cv=pass;
        d=google.com; s=arc-20160816;
        b=edr2JRNNarx7xx/iKO+G7KpBv8eipDqv9lb9n/s3YQIPOyRG7H+UbL1sXwJ4ElbyZ3
         9ooWaMwMZl5P8jSJXnRPLHqdLCtFX9zLgO3lXJ49UY9fWed3G11KzBxCM25FOIjNNIVz
         dtFCAU8D3mLxkScPSmbjDHlLVzfra0bn2dSGi+iZW4/RWgOLSyC2AAH0ZxDwzw7BxN2D
         FRbyx8wkGLGiY9NYFUbjcszXocU22BDLSME1iTBgDPrmch1FLL7qpPmE7FgR6xPZICTJ
         GExY24wqUw7Wsy44vGJ71coEjaGU4M3eIqtOLRB6IYC1TyuFOv5eFc0CYLQycMHg0Aim
         X7Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=TZRxaVe0GiQo1j4RDU1vJkJsVvALLkKumQXA1hH61o8=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=e/LmhKXAkocWHGWYB8pZbFgs+FAphdSPOnnGpdy/I+BKl+tOur9m3ViXtK1i5eaojU
         3Vi42orxKmvMwKo5IngFgUcq39aG+wEhyLLC1Va/T0xrXBuXR3ReKgtNhynl6dPXC+38
         hTIgHj7JA7b1shyVotZ1wenzBID/1ZHVmJby5UNtaTCJtR2d9SjhTb6Xnug9Q2fMBFvw
         rs3e5YRQ4gX9jSyORN6/KnKd16l/adEN4h3cPmH/FOHgL+JFQNhBdDXbmgtkv5WcKEpK
         pZriKGCHyYqzm/4yVvCc7vw9It8xFI3bGeMORNQbXKVmvA50Ts+15MNZm4X2M5oqAyG+
         0qKw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255789; x=1700860589;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZRxaVe0GiQo1j4RDU1vJkJsVvALLkKumQXA1hH61o8=;
        b=JxfBTsT9jJ13tHeWqKRPdNj9FUrdhKR+w5r6I9KZpMAzPknodiE8YtFwBKqqabU3/w
         wBoImdKGAI+M13HL/8YX56e6W7v1GQgvtHs9qwdIKCOp0eSP9znXGeO9+wWJgLhLt2yF
         vBn/trz/l8df0bvc/cjXONrINShfPWJ1BSFLkTWRsw/dZyb0arUQxTNWImZyTFsL/KuR
         45OVZvcScyL8G9SXg7O+bdDxS9qYaB4AhGQH5s+5uZccZkf6eK0dr5WMHMFyUNbr8Lqo
         FXLz+LzhWsfXnIymUCem5FRc1AWDvr6EXS4FYCiB5xRsyo/Tt2TqcGBIUPr7rIP/T+w2
         yUSg==
X-Gm-Message-State: AOJu0YxlzXK3WDEqxVy5yMJ30KvmFsYeC9WAg+cW8gRNHsJA4ik9RwGw
	UoRgL9VlWQ+Sjl7zbKSu/AnZjw==
X-Google-Smtp-Source: AGHT+IEe03btXEhsy4dRf1hNIIq8/yUvkKjJ4yLH3j6FneomSG0UxQxJkLcmbGuw3j+6RLqCOe7EkQ==
X-Received: by 2002:a05:6820:552:b0:57b:c983:bce9 with SMTP id n18-20020a056820055200b0057bc983bce9mr930247ooj.8.1700255788963;
        Fri, 17 Nov 2023 13:16:28 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:b87:b0:587:a4ff:5f8d with SMTP id
 eg7-20020a0568200b8700b00587a4ff5f8dls1958571oob.0.-pod-prod-04-us; Fri, 17
 Nov 2023 13:16:28 -0800 (PST)
X-Received: by 2002:a05:6830:39ea:b0:6d3:14dc:823e with SMTP id bt42-20020a05683039ea00b006d314dc823emr405605otb.11.1700255788243;
        Fri, 17 Nov 2023 13:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255788; cv=none;
        d=google.com; s=arc-20160816;
        b=WqmoCAzDv6lVoyb9cm/Z07mNX0qzb1jDcspXI03TDZfZEctD04ZbCE1dPQ/FqFLaUP
         Vc3lOTLREikAGFQsQVzioxhyBwdVqLRheIYnP/ZiN1CMM+MJVm1VAOiNdBerj0JzXLLI
         EyzW4yQGeMh3x22aazTmVBIRiCZRVzREoi9avxW4itubDpxW0tOinICNQC/zmmEPA9H2
         Aqi0z2udiKhU3jnN9e3ZGFoBRAk7HYaZPg0NKZLaPN1PoeIYl7yFnBlmV6aMYPjhPuTE
         2u/Zp5MQiw5vkECyNBoTpWlfXQeMfhGg2KPDStPoJdXQMc9f1qfnY3+pUYj9qqqiD5Gm
         kLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=k3JiidRzkKBvkLp798rxmXLVnzVJoyLEMATfdNMMsEo=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=pHEW4IXQTPU3csi3M+nNleIsty+TDniWQo3LTi4b3ZNo3lhoEAp4s/ogsatCSyBFoS
         Y0rbYh3W6Ub/sm8PzM0Oo9sWO7V8oPpsmTOFPVMVHHHOHa3GEp+bJe1LI44pEePCmUKU
         EO6KoyXO/RkLOkfsFjYv6jAO14cPVW8/SL7IRR3iMqc953Z8Um+lhmHZnwuEnU3U4zFF
         I5515nGky5AvmP1uHv5BmfXJyrbMY1vD9J+k3OwMKHocJRc6lAnNqM8973urFdYgX/Y1
         Kkax0wvIupNty4Hk0tUziN05wERnAPqRNVhAXWpJICicntcYxzrRzNs5bYV75exeJdUG
         MSzg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id dk4-20020a056214092400b006709ee177f3si2315040qvb.231.2023.11.17.13.16.28
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:16:28 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-c5RD3WGoNyWK8XxcXhqhgg-1; Fri,
 17 Nov 2023 16:16:26 -0500
X-MC-Unique: c5RD3WGoNyWK8XxcXhqhgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CB5D3821354
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:16:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7705BC15885; Fri, 17 Nov 2023 21:16:26 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE580C15881;
	Fri, 17 Nov 2023 21:16:23 +0000 (UTC)
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
Subject: [PATCH v2 11/51] netfs: Add bounce buffering support
Date: Fri, 17 Nov 2023 21:15:03 +0000
Message-ID: <20231117211544.1740466-12-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Add a second xarray struct to netfs_io_request for the purposes of holding
a bounce buffer for when we have to deal with encrypted/compressed data or
if we have to up/download data in blocks larger than we were asked for.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/io.c         | 6 +++++-
 fs/netfs/objects.c    | 3 +++
 include/linux/netfs.h | 2 ++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index e9d408e211b8..d8e9cd6ce338 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -643,7 +643,11 @@ int netfs_begin_read(struct netfs_io_request *rreq, bool sync)
 		return -EIO;
 	}
 
-	rreq->io_iter = rreq->iter;
+	if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags))
+		iov_iter_xarray(&rreq->io_iter, ITER_DEST, &rreq->bounce,
+				rreq->start, rreq->len);
+	else
+		rreq->io_iter = rreq->iter;
 
 	INIT_WORK(&rreq->work, netfs_rreq_work);
 
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index 4df5e5eeada6..9f3f33c93317 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -35,12 +35,14 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	rreq->inode	= inode;
 	rreq->i_size	= i_size_read(inode);
 	rreq->debug_id	= atomic_inc_return(&debug_ids);
+	xa_init(&rreq->bounce);
 	INIT_LIST_HEAD(&rreq->subrequests);
 	refcount_set(&rreq->ref, 1);
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
+			xa_destroy(&rreq->bounce);
 			kfree(rreq);
 			return ERR_PTR(ret);
 		}
@@ -94,6 +96,7 @@ static void netfs_free_request(struct work_struct *work)
 		}
 		kvfree(rreq->direct_bv);
 	}
+	netfs_clear_buffer(&rreq->bounce);
 	kfree_rcu(rreq, rcu);
 	netfs_stat_d(&netfs_n_rh_rreq);
 }
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index 47270f5d9e89..0bc90c4035a2 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -196,6 +196,7 @@ struct netfs_io_request {
 	struct iov_iter		iter;		/* Unencrypted-side iterator */
 	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
 	void			*netfs_priv;	/* Private data for the netfs */
+	struct xarray		bounce;		/* Bounce buffer (eg. for crypto/compression) */
 	struct bio_vec		*direct_bv	/* DIO buffer list (when handling iovec-iter) */
 	__counted_by(direct_bv_count);
 	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
@@ -218,6 +219,7 @@ struct netfs_io_request {
 #define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
+#define NETFS_RREQ_USE_BOUNCE_BUFFER	6	/* Use bounce buffer */
 	const struct netfs_request_ops *netfs_ops;
 };
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

