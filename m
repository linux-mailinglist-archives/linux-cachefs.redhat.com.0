Return-Path: <linux-cachefs+bncBDLIXLMFVAERBTMZ46VQMGQERIW2NZY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A530811649
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:25:03 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1ef4f8d294esf10582750fac.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:25:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702481102; cv=pass;
        d=google.com; s=arc-20160816;
        b=HwDAnjOnNid1epbiCFJ5mO1Yyy98sRXznpHJSn8EYY97jAYqxV+xOVwtOXw0UTnNWS
         G29xfaZeLlY2FnLZkfKyVNqvYCY4gP0lVlClUoHEG2cy3R4Itbiq6JxVi+TC8vYoin1x
         rW7qxN60cSAub/N3GsHYDWOqdTCLXjSvRJ9tfpjwCe4Q1Dt1KB0pfZRpf9UDcajNYLvJ
         AtdSFkrHLKxqJW8mLGJA31+2Dm3WB9dHBu+8O/G8dieT7FMFTeZNKDCDCOTSL7SzQObZ
         vlFIbwNr7Exm4EYJQfHg6z/eYsFxoM1hPDJ7o2SKIcUMzWiVlXhl9hlnByMtne2cAM7Q
         /Ewg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=1S91p/x27DEcM6XaSXgR+uKViAz5+WoHUA85ISBVmxY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=w9P3a4KFH6AYcj5uvqPOIETK/QHnZhsQJHMW+Iyfp2wNctZWzB/71TUdsQiAc1YDSg
         C2LkaQwNw2Uw8aXS/0KI3DSIjHDDje2bLtR47HfXEUCMORY2jBMIe/8Fxjw3nMxsU7Yg
         cok6N8EAojnATJ+1AJAq5LYXi8I5/yd/yFPnx8U9Ogu+g1UADCBKMmjD+v9KlmVoh1XC
         LaoqNiVzVAcnpu6MzIx130m6Iv5BaAFAE/kYBWvF53bAk6P9EmTRJ8ClrVZBDel3dGKO
         Avs8mtQZjwEn9pzdqtZM74MO3ztU3t05hJ4kD/wC7U7jE+mUWvV6G3Jn0icZwoaz+oGo
         MkNA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702481102; x=1703085902;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1S91p/x27DEcM6XaSXgR+uKViAz5+WoHUA85ISBVmxY=;
        b=v/ItZ5MyWBIJ4SU4qj+PA/+HTVlxhD41JKQhohiX9gpNnT9WhGnKbio9nVkSFvsJ5X
         X2k1OzGsQx3KmhSlFnSU+/PxbXyCrtY5u6m5pba0G9mT2e77FlNlC28dEOpqXjFa4UxK
         DldGI7uKSvCVmZRpuRX62F3WwxcP6nDsRuFUelkTo2Q4B3CfTzuKi4bFSo1tD+vIELJk
         RcnNqwWzGEys8297J+Q61oUpJ4nfrJtzy0nZW/s+HyR6f9H8LvWcqHJDoPgKBvCz81bz
         nSverQMxGyydJOFYdI2Yl50XcDNwY9fJu+uSA62asxRX0LSpNAASB3DkzQlVrdYfznXn
         TT6A==
X-Gm-Message-State: AOJu0Yxn+j6hSryb7mOByaQTciSEBp08rhg8mXYEoms1Io4dL59lP5BQ
	PjCOmiwg3SE9XTd99vjyTCa7ag==
X-Google-Smtp-Source: AGHT+IFH1FSkvKcqQJPRM6Q/i4wiO/icC5On3PWeFpwiW8gHpdz9CbLK82grAuaGN/oWB9W2kbXRHA==
X-Received: by 2002:a05:6870:5ccc:b0:1fb:e34:e31d with SMTP id et12-20020a0568705ccc00b001fb0e34e31dmr9121867oab.24.1702481102009;
        Wed, 13 Dec 2023 07:25:02 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:e78b:b0:203:315c:ba9f with SMTP id
 qb11-20020a056871e78b00b00203315cba9fls533537oac.2.-pod-prod-02-us; Wed, 13
 Dec 2023 07:25:01 -0800 (PST)
X-Received: by 2002:a05:6358:52c2:b0:170:e12b:c73f with SMTP id z2-20020a05635852c200b00170e12bc73fmr3982899rwz.52.1702481101434;
        Wed, 13 Dec 2023 07:25:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702481101; cv=none;
        d=google.com; s=arc-20160816;
        b=oEWyy+PVQ9gTFCCKdJNXWZiezaEBHEl7Cb/+sd9/8yKSouHghcEftp7mLPKxNCV/AA
         C3V42TGCkKXmNe+Xl/7RcVdxtVvpbn5zMVqwyRt9SXwL4QWjOHNMK4s4oLfxb1ObEIRE
         QGNz83S+9NLE+kYqCIDkPtFsJFH6MKKomxYU90hWIc9vGh4zHN4NdrUIRB3/+oRLjuSN
         OQY6S0tzUxhh4JhOocEUVny9fuXExngLXX6bbGAZHfcwl/Z6CrIdOAtcgicsYq4Nd2ND
         N2F0nTKQCUIv6AvTB6Aswp6GpB4LFJqLysey2r09jgRXgRtbe9l/ftEgfu9lGXs1blld
         7iqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=TyeDCrkCzlrF45NKmRnzOuDvS9hPtHcwk1ZYplID5CE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=xuf6oPWxQiyGS+OU3vPc01L/XLk1IAeOmUxqol/ZP5f6s9757ELqcOiExkdB7M7s+K
         bil6W2uO4pgL3Ul8haCOuzYWJPWFacJzWvLDj0KV9fsy2GUGhUPVdr6P7yoTXlUqHkbs
         KpxsQfh6V7cCGbKBHN8nEOomrxGFs4X2cyDFlkSQcYq1oK79yPv6fhr23oYrXyLS4ThV
         cB11hAUzUEGdX1r2UIzkhKoDOoQEV9mJ4bOC4tqqGwdNUM0QFdVSqhRjgMTdGnnIk7VO
         e9qhncd2DTUOIyM2BdAYiD6M5kTy6/npvmlwrJnrl+Ked6V+O5CuKeIsn6WRkpieT++w
         /Q9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id o10-20020a05620a22ca00b0077f036f5580si7510071qki.565.2023.12.13.07.25.01
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:25:01 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-jwebQiHnNlqEowfa2hDkrA-1; Wed, 13 Dec 2023 10:24:59 -0500
X-MC-Unique: jwebQiHnNlqEowfa2hDkrA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79BCE881B6B
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:24:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 76AD951E3; Wed, 13 Dec 2023 15:24:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FF89519D;
	Wed, 13 Dec 2023 15:24:55 +0000 (UTC)
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
Subject: [PATCH v4 15/39] netfs: Add bounce buffering support
Date: Wed, 13 Dec 2023 15:23:25 +0000
Message-ID: <20231213152350.431591-16-dhowells@redhat.com>
In-Reply-To: <20231213152350.431591-1-dhowells@redhat.com>
References: <20231213152350.431591-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
index c05150f51beb..8a5b8e7bc358 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -194,6 +194,7 @@ struct netfs_io_request {
 	struct iov_iter		iter;		/* Unencrypted-side iterator */
 	struct iov_iter		io_iter;	/* I/O (Encrypted-side) iterator */
 	void			*netfs_priv;	/* Private data for the netfs */
+	struct xarray		bounce;		/* Bounce buffer (eg. for crypto/compression) */
 	struct bio_vec		*direct_bv	/* DIO buffer list (when handling iovec-iter) */
 	__counted_by(direct_bv_count);
 	unsigned int		direct_bv_count; /* Number of elements in direct_bv[] */
@@ -216,6 +217,7 @@ struct netfs_io_request {
 #define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
+#define NETFS_RREQ_USE_BOUNCE_BUFFER	6	/* Use bounce buffer */
 	const struct netfs_request_ops *netfs_ops;
 };
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

