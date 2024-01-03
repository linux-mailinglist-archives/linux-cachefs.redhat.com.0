Return-Path: <linux-cachefs+bncBDLIXLMFVAERB5PM2WWAMGQEZ4URRRY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB67823000
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 16:00:06 +0100 (CET)
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-dbcd9f4396esf12676380276.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 07:00:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704294006; cv=pass;
        d=google.com; s=arc-20160816;
        b=b+0IGoSV/yAzaSdvQPkT4Buyao481vpgX+dbKOxhijyCgjJEeW4YGaZuPjBk/va5Ya
         WwjgLFE4lAtRLhPf4HLLi7L6qYVNMvx+oUGqcvwnyQ9YaPE5vb9HU7+olQqB+xlVtbEe
         wSOAqwEYyMw2KMUuR42UhDofQy4RikDdKd0aMH4ourZlPYpAllusPp4Fb5IfIdnX2oY4
         pXA0PbpwpE89DkywWsD4hQMXwONi+JJRX0BebyURHbOYeppw+Fq1Pqu+jRXtXeozdU5h
         qZbdl0k5ItieHoFl9+rR2NXijGgJQ70mMegPONGtc0eCG4Z4NrbYM4TtKGT68cdkrzR4
         cg+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=+rny6ftYv3clqj5OGKKOL+KWS9NgkNOFfvmNdRaOg4w=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=bAVcKPB5KH6UTHxAxvtBrG6xauEKyVaQb9AqFjz7FheG8EP1ZRGkXGljkYXqxmx09P
         g4Y81zF0+Zd2iJU6ZIH8yfvmpMqLBjebagOtWKMOlILhgFXBF2cWyUORsp1svt3+LV2R
         p7wUZftBF0Tv3WHWjJYW4mhlCAvDPmNN/Br0j7Qgui211CTNrIsiS+1RDet3dKIAt8AE
         6ikv6wI2LT1a0ph8qCPyc9tB8aDlwiOWUxU/pjztbGQtfEUXnNRTndzGJbQPcDk6EmjH
         aoNxF2ZTnSJJHI31aFXiV3en1FbLXBxU/8/K0iAkapfdz2PxJy96OmULgb7VRB0YlevO
         KD7Q==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294006; x=1704898806;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rny6ftYv3clqj5OGKKOL+KWS9NgkNOFfvmNdRaOg4w=;
        b=QihuvGDRUHbmMEuHZmYihcz9YQIS5DY87ANt/shROla5aHMPo6qBTWAjd0gys/VvN6
         MfBa12daxz/tn2xduIlCNkuS35qj9+xp5WumWMzplvzWfIBZIcD+1QxjXFMGdRQQDr9p
         l6MneQrRenknesxnQWqGioVwwOkju8uiiA1u4o+Luvd06WRdJ1z7u1IEjjDKP15F4Edk
         ukUDjBIlPfeI9es48x2KreoAXi/FnSuv721yNu5y9OtqS4eC/B9AEqYniOGc2zG2va3E
         nkCip64dvhae/qclDb8sSynIFW980xCYylLcEXSeMUb7NnsZj/YxmdYeKFFfQvY8U+D9
         eDIg==
X-Gm-Message-State: AOJu0Ywx0w7clEVKFaEqHIO/15LYAuHJ6I/mrKGEuRa/+2atWp9BbczY
	E4dHMdyJ5sRHPLUISzJfBYq1/Sdge58QIA==
X-Google-Smtp-Source: AGHT+IFE/GfHW5xyfpxyYU2ZwStawELsLQwagqDpiprf5oCiWInGq7a1zXUEsDgtKBp9LFuyHf9L9g==
X-Received: by 2002:a25:c02:0:b0:dbe:a4b1:6a42 with SMTP id 2-20020a250c02000000b00dbea4b16a42mr538788ybm.60.1704294005814;
        Wed, 03 Jan 2024 07:00:05 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:af52:0:b0:dbd:4bb9:7eaa with SMTP id c18-20020a25af52000000b00dbd4bb97eaals456598ybj.0.-pod-prod-09-us;
 Wed, 03 Jan 2024 07:00:05 -0800 (PST)
X-Received: by 2002:a05:690c:2e08:b0:5eb:6738:193b with SMTP id et8-20020a05690c2e0800b005eb6738193bmr6952058ywb.14.1704294005031;
        Wed, 03 Jan 2024 07:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704294005; cv=none;
        d=google.com; s=arc-20160816;
        b=Ay4fYrkW2nATvfn4wuSCEAPQt5PgcqHtqukj4k8on7i5F10V1Dl95A3XPZTY+l/IY2
         DNCe0/YjNO9ccQMJe/DuLKSx7Ep5bIU72WAJeR1CpH6p3Czx+SgSs/LDsCZIV8Ewm5B2
         bpzYbs32cl4i5O+ewoO3wx0VDrAZSCJZeoolsMasoQvU2/qmCispqsy+SxcLIapctNhT
         pZfGvhV0t2swGU+Wx+dt8ualupv7OYHSyMglZzdqL+keVAgA2aSFVUo9rOB0ynLLVlYb
         nLCbBSeK/MIMmvR5y3ox89OSmr6ii5fL1vO2B8jI88k1P/lxEYw8dSUARVK0h+zOR8EA
         p01w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ZUPriBHgZCe048XAouZ6FVZlUrGVgRcZGkDmJ6vhI+o=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=JmF0g23tCRunBbkHp9O7D8F5YWY1ap6czd2PLBAc4k8bWIM44XY90N9OSIBpg/p1t8
         7JMtngP36qeKFSYC9za7i35aNFvaV2P79ieKJVvBVQObc1Okrr9ZA5GSZ0D+KZ6UJZhF
         Oxm1DN/qkXVmNil9cE2AEuvz2bB/0j7g7TyApTZDZkStrzsWQV4A3tQiaR6e7qNANROi
         /SnaUYEyW/b+olj4RpaEciNuUZ4yziJOhryFKa55DQca1NcCmn72fdiHGFhApRLSl1hK
         b3Dx9KM5fl8UmI3gdy90rd1JgecrWq7pNl91Qa1uxY78hUUr+CeWlot3ujXU+MkdIBXP
         7T4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id cx12-20020a05620a51cc00b007815c9558cbsi16314575qkb.224.2024.01.03.07.00.04
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-DhmBazr3M9O9Ax6GKcrTDw-1; Wed, 03 Jan 2024 10:00:03 -0500
X-MC-Unique: DhmBazr3M9O9Ax6GKcrTDw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E78E5881B6E
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 15:00:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id E43463C25; Wed,  3 Jan 2024 15:00:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0074C3C30;
	Wed,  3 Jan 2024 14:59:58 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH 3/5] 9p: Do a couple of cleanups
Date: Wed,  3 Jan 2024 14:59:27 +0000
Message-ID: <20240103145935.384404-4-dhowells@redhat.com>
In-Reply-To: <20240103145935.384404-1-dhowells@redhat.com>
References: <20240103145935.384404-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Do a couple of cleanups to 9p:

 (1) Remove a couple of unused variables.

 (2) Turn a BUG_ON() into a warning, consolidate with another warning and
     make the warning message include the inode number rather than
     whatever's in i_private (which will get hashed anyway).

Suggested-by: Dominique Martinet <asmadeus@codewreck.org>
Link: https://lore.kernel.org/r/ZZULNQAZ0n0WQv7p@codewreck.org/
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: v9fs@lists.linux.dev
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---
 fs/9p/vfs_addr.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index d8fb407189a0..f7f83eec3bcc 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -28,8 +28,6 @@
 
 static void v9fs_upload_to_server(struct netfs_io_subrequest *subreq)
 {
-	struct inode *inode = subreq->rreq->inode;
-	struct v9fs_inode __maybe_unused *v9inode = V9FS_I(inode);
 	struct p9_fid *fid = subreq->rreq->netfs_priv;
 	int err;
 
@@ -98,15 +96,13 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 
 	if (file) {
 		fid = file->private_data;
-		BUG_ON(!fid);
+		if (!fid)
+			goto no_fid;
 		p9_fid_get(fid);
 	} else {
 		fid = v9fs_fid_find_inode(rreq->inode, writing, INVALID_UID, true);
-		if (!fid) {
-			WARN_ONCE(1, "folio expected an open fid inode->i_private=%p\n",
-				  rreq->inode->i_private);
-			return -EINVAL;
-		}
+		if (!fid)
+			goto no_fid;
 	}
 
 	/* we might need to read from a fid that was opened write-only
@@ -115,6 +111,11 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 	WARN_ON(rreq->origin == NETFS_READ_FOR_WRITE && !(fid->mode & P9_ORDWR));
 	rreq->netfs_priv = fid;
 	return 0;
+
+no_fid:
+	WARN_ONCE(1, "folio expected an open fid inode->i_ino=%lx\n",
+		  rreq->inode->i_ino);
+	return -EINVAL;
 }
 
 /**

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

