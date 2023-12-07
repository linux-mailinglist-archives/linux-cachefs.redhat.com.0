Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOXPZCVQMGQEMRQ6LDY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id E0966809356
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:07 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-423afeb1cbcsf17308671cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984187; cv=pass;
        d=google.com; s=arc-20160816;
        b=gQe0PR2eK1Bv5pXA16SfPFqogJkxzYUoS4h/dWL2Ej+hT0FgnHg1ndOKt9dwyCjpH+
         gSQZDJB+G+Dc5jb70wIOa2ML7cyOkg/mcFJKwTAfKVXTYTfFtGRc5RMCDlrkHCyM172E
         /u8a4h9Oelu6q0ZcBz8BJdpEBTldQ6SINvhKRSg7ipE01BG9u5gGaAQgy4jzqoyJx757
         Td1FWHkFxaqnOtdxQ9ZG9eEGWp7EXtLTwN5O9KzNA7fSd5jdDg8SjpsazlGof/YKAQXi
         sFIOxC/MFvBfd4fmNXnvaXN5UWsONsx4R+yEqUKqoRX67H85pH6ZbN3Q31ktSFRKHzVP
         GSlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=1S91p/x27DEcM6XaSXgR+uKViAz5+WoHUA85ISBVmxY=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=zVLtWvF/H91i+rDW/iAnQYrhvnffBCwCDc5iXGTJId4ffvy9O1MUV9X1hc+sUp5PBU
         SbGhzpbl6GpgsSoioUn9BeonMYxtk3c72iZxSnznmctWUwSSDArcfD8pXEx6FJBlwRLa
         uKBjfvinIDqFV6v4o3OG1QoKpFuBrxz54xawHny8iI9bi6YqYk8/IzjVbtc+rWny9eRj
         EWLQ5QANx4lTU8KwGDXY6TW7ifsW4Oacgi7byhBfOh0vWniWI2WdKNbbxYZWlv2P4Y7z
         QstKvTIRoUhla60KVB4/yJ9ApgwGWq7yt9K6jfP9TSFZatnQfQWZHPLeNBYQ58tNMLLv
         bZnw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984187; x=1702588987;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1S91p/x27DEcM6XaSXgR+uKViAz5+WoHUA85ISBVmxY=;
        b=OLceVRGq9NyYEV3K8ErV7In4RhMI5R3kc09JPCnUunSXkyFoxIiFfWL9dYC03iRg5L
         qcMEx30f6PiH1SVZE6LcxA1Q+zHp2zgYp2SDaI0wRBzxZ86zIIZIU5qOsuxU64ZVbm67
         1CaiXDOWWfXRb06Ce5iP0qjld4ZtZ/cpKMDDabtAHHdMLzyQ+brysqA5+jo4oEQRq3m6
         BXtF2pq7f0iYnrJbL9sgSLJBdMn3QNRGHzXnsiemJoJqChlwPOYVcJBBhIqjQeXF+j+F
         Cf8n+aa8aW/beCzZMK9Thzb2g2zIOrjpH4ZFrwDXyZmDfuCP+tQI7MfQ+wrq/L6k68j+
         MGJA==
X-Gm-Message-State: AOJu0Yy53HJUHqQN2R2hUu1a2btQ1q4fkDpFJFivlywe/yvPmfNz5hl4
	cQTKDE36Ue3/LENlRyWTPoIXCw==
X-Google-Smtp-Source: AGHT+IGcTvlaIbrOTZXfk1W5vyNxBbrdAE4N8XaehTRl5c7S/5fU2rbs6M0RuLKu3Qo87pNmmUDuWQ==
X-Received: by 2002:ac8:7dc4:0:b0:425:4043:1d92 with SMTP id c4-20020ac87dc4000000b0042540431d92mr3512808qte.101.1701984186845;
        Thu, 07 Dec 2023 13:23:06 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:41b:5e46:aa61 with SMTP id
 s36-20020a05622a1aa400b0041b5e46aa61ls619560qtc.1.-pod-prod-02-us; Thu, 07
 Dec 2023 13:23:06 -0800 (PST)
X-Received: by 2002:a05:620a:8b16:b0:77e:fba3:58cc with SMTP id qw22-20020a05620a8b1600b0077efba358ccmr1519070qkn.93.1701984186395;
        Thu, 07 Dec 2023 13:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984186; cv=none;
        d=google.com; s=arc-20160816;
        b=MALbyZZAYX32gGLWM0yG5uOy1PmGQbIgtxrdf5ZmYx1JahyvaPiNfuIYudx+SJD4Y8
         2sjRDNKmwGeoYKyDWqS1K2uMhuPHTeb+IZvEWkMW5Gnvoq9yGsLXXkc+Mun91aW0Y1jD
         rvgc0+Knq4fp+n7lKByOiZPIHaEZXn8B71vVBskk5qyBdO4nhZKDnBGaRlTsKj2Ug3gb
         AiRc647tGUf2BBXqAzTz2ocFF4f5+NoRqBBl53wUg1iBeBFv3eZN0C4mCOXiPBgVFbu4
         D/1suIpuW/OoWBd3IZCPwphQfSMGqv0KX13z8JA6E+oxYVSOpyViRtcuGmcNjC+e/LNt
         P8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=TyeDCrkCzlrF45NKmRnzOuDvS9hPtHcwk1ZYplID5CE=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=Idt8VkmY5JKTBySz0qkF0elnSLWn5T8CQumJikjN18teHcdAdSxesKKn5tt1m+aEA2
         yUVwDMvXQN+iFOewsFuxOWUG3EpvipB104VTd+7JEVnZwhwW+bIeI42BcR0g4rzE9aL+
         hhkgIYNewg3PM8EfMl9bZIpv2UJ1s5t9uJtMj549itHVQc85b3O20odGUEu5KpXOMb38
         YKGHTF5NJ0UsRKx5hGIyRDxQRzgmnnQ2zfu3Sj69kHQ6s99pEcK+EqqaPMt0GEZooMMg
         eKpeC1VgiUPCAhTaiHbclDt7sF4fNA9i27BQN7KiKCOFZqVV+X5wUQSfjOOoaPa4EvO3
         j7zA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y11-20020a05620a44cb00b0077593890958si685537qkp.128.2023.12.07.13.23.06
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-EJ-IuHtgNzWHFH-7chcluw-1; Thu,
 07 Dec 2023 16:23:04 -0500
X-MC-Unique: EJ-IuHtgNzWHFH-7chcluw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 698812818769
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4DA26491034; Thu,  7 Dec 2023 21:23:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3B7F492C29;
	Thu,  7 Dec 2023 21:22:59 +0000 (UTC)
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
Subject: [PATCH v3 15/59] netfs: Add bounce buffering support
Date: Thu,  7 Dec 2023 21:21:22 +0000
Message-ID: <20231207212206.1379128-16-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

