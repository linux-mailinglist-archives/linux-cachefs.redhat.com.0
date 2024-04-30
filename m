Return-Path: <linux-cachefs+bncBDLIXLMFVAERBKPTYOYQMGQEBBAL3HA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAB18B77C4
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:01:14 +0200 (CEST)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6962767b1e7sf100601736d6.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:01:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714485674; cv=pass;
        d=google.com; s=arc-20160816;
        b=drhsAXRwyr4zEQNEXL4W1XsYD4ABW0FIVfGZlq/XiAMQ2jdxBohaU72Z67n4OoBQO/
         5R+pYYL5zMnaleXtEJLRiNvjxps8BzpL5GnV/yN907HWo/f0dNfy1k6OTpKmrWxREjkm
         /iaknA2nSnUq9eqIG/QlzWoF7Moatg07MX4rTmZ7gGg3UgPWNqioo4SlLdSJqa6sV1/g
         IaodJcSp3rHWhu8JY79NU6VGgy+pGL5mCKR/fic7D8tMj7uQRlRdYwfGgDcvUpt+winV
         /rTwbQjcNfosswvHbFdVagZ6Ml0JUVdhhs1EObjHQgP0zeEGixbWLWtTeefWbhv0SRmz
         66Fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ZZCgQ/JAOCTp3k/Bkqh0LSbBQp3RGU6eRUPa8QD0KbA=;
        fh=t0zCcPVzzIV260b159CPz/nQVjW/GA7MLsQzt2dVm5k=;
        b=srGtr9vQ5Up4xWA7JthMoLsuZ3O4queNUV+vP3is2AKj2qsbICu8t3ARp3opoeXapI
         KcNOs3cuGZR1b3zA9o2pXrLLFCFArQZ7YDb90AgDB7itzEgC88eyUB4Q7xF+Yk2gUjfS
         6O7H1/x0Rcy2b2C3hmhIcql3iJrOlawBaJBbHawJgUL4rfhGUWSnf/RKtc7jzfFslQ6V
         2aAzD70eF/b03xEpX1T1b4/7sTAaPyAB8UQ/dhfVoz4cb9sgvic0f6dVCNj+gjvJDW05
         tmsA9Ee1bYM+8nBHEC7cLZMa9KGwhGvsaFZ/fySNdtGuetPl4wIrqGkFysP0OKXIzACq
         0JEQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485674; x=1715090474;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZCgQ/JAOCTp3k/Bkqh0LSbBQp3RGU6eRUPa8QD0KbA=;
        b=cPjMpijloI/dUSGtDhCTpF2lo/JXXAMx7EkrGCNPbQ5kqylEOVQRGVWuRarUYsz8rh
         SOM1klpnFpahpr1LWoD+l0jfqGoxwZXSBo2S7i2xCAxf6OzyImtMMU7Czwl30xqQ5FRH
         VPv8zLYkEP1BbEpdeOdDT7/VZiFDplXPD/55dz7J8dTOPu3CAO/5uMrrTNGxhe/yK0Eo
         ZARYzNIv5JbYbqi6EMdqj2yXZNp2nyRU0Qewc+Ae6MtAmQsnN7FHPtsCI/ySwKeRGUaY
         37Z49LgNiMEm7Z+H1fyeIwxtnKxcO6Z9NetuWhJuY1kHnSBMvkx0VNqYM08ZzAfr5iKz
         nzLA==
X-Forwarded-Encrypted: i=2; AJvYcCUqohspZIRwblSF6p+YQuAV4xYFgU53egT18lwdTCCn9rZTBc86Me5gmGD2lIL4ZKIKm7qEda/jKP/mN32TeoTXR5Sz6yabj6f3H/8=
X-Gm-Message-State: AOJu0YwO5dGrObC2vFN9r8Fbp4D4+zMoiLAe1w9VaocUFaQDjC1cUIWM
	YGoS6tf0aYnLHXIAnvXJhbHImvOF1ZpYglO0koEBBLYMhR8INbcRwmPvbxwIzXA=
X-Google-Smtp-Source: AGHT+IEOYWxNcb3qwE8mDNmmoJw4TcYvEQ9FJmt9O9HYPLRY3fpKY2T0KY3vtd8r3YXc045PJOk6tw==
X-Received: by 2002:a05:6214:1312:b0:6a0:8201:7fa9 with SMTP id pn18-20020a056214131200b006a082017fa9mr18433384qvb.58.1714485673578;
        Tue, 30 Apr 2024 07:01:13 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:234f:b0:68e:fab1:8005 with SMTP id
 6a1803df08f44-6a09c4ad896ls77241206d6.0.-pod-prod-05-us; Tue, 30 Apr 2024
 07:01:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUUUaFhHVJ7oRRURhOue8UyxDNIOtJwJTGeu8ndIecTjmxx5pqoIeIBELxHpqon5A1tdRowYrMhQhlWT53RDJvweD+060ng3aeDKTjpe8g=
X-Received: by 2002:a05:6122:251d:b0:4d3:3446:6bc9 with SMTP id cl29-20020a056122251d00b004d334466bc9mr14760405vkb.14.1714485672107;
        Tue, 30 Apr 2024 07:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714485672; cv=none;
        d=google.com; s=arc-20160816;
        b=cgBcvUIO6K9nAathBqnv1GLKLDpnEkLzVrhKJ9h0Rad9DTbOn7GB1/xhEmt9yMugdF
         60mNGeht0gdCukd1w/y6KG23EAYUUpenDo+zf0bqkMfFYK9hx3oHzjbLE7wwA5vKPdSf
         LyY6y3CDfl1RmZOfep7CAqnBIOIWDz8YZ/mFJDYX3pXWg0x004pjeM0TsxQvcLnhupP5
         UY6vrM9dIPghnWefI8X3eUHAOtxt1X+hJgwWY1ccXOePmVn7jVXl353MdhoBd/c0y344
         EsMWkoIxfOVf5ZPpmx/NbYsJyG56mTueo5Tsw/Y2jWP1JHAvn3gYns71TTBAo907cPRY
         H9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=TVvsQkYCcJVRpP2m+QZDwQmmWSsKMODgUlfWruXZbkI=;
        fh=D72SRyTeGTT5e8cHVnWso1+T4PfZOoBdL/zxY6by6YI=;
        b=P2Eno+eBqBBqXRJ5kaTVjaJiIT4gyaViQuuMAQRQyKnPhlnxLDNweZBzCaPK5ulkm9
         DzxQY/TpEFUGuXysx56SJ3oyj9cG++ESQjhUf2fbZbP+AFI7GB22HF5EZf1jg3T5BYJ6
         zDw08DVWgNVx3Y1JdgDtjc2AIdwKAHbRESUB3KqTxoAEilWtpe5JVe2OdT25B7YPn7T5
         YvanjE+lZaYs9gDLByLkcDd6dxWpjMkh52wZHbi9HyISlTAq+Z09+kBY9RmFWANPu90C
         ce5fJ3guQqPCf/gjGrEQFTwSXQrIiLOB9xp9e6r3UAdNAXmWvcwKXH+Hzt4qgACar/XY
         Busg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g19-20020ac5c1d3000000b004da9be8aaa4si4355043vkk.147.2024.04.30.07.01.11
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-Mlnv3tZYPZqNCw-DdWAt1A-1; Tue,
 30 Apr 2024 10:01:08 -0400
X-MC-Unique: Mlnv3tZYPZqNCw-DdWAt1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C9BC1C4C396
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:01:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 28E731121312; Tue, 30 Apr 2024 14:01:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71CEA1121313;
	Tue, 30 Apr 2024 14:01:03 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steve French <smfrench@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	netfs@lists.linux.dev,
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
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v2 01/22] netfs: Update i_blocks when write committed to pagecache
Date: Tue, 30 Apr 2024 15:00:32 +0100
Message-ID: <20240430140056.261997-2-dhowells@redhat.com>
In-Reply-To: <20240430140056.261997-1-dhowells@redhat.com>
References: <20240430140056.261997-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

Update i_blocks when i_size is updated when we finish making a write to the
pagecache to reflect the amount of space we think will be consumed.

This maintains cifs commit dbfdff402d89854126658376cbcb08363194d3cd ("smb3:
update allocation size more accurately on write completion") which would
otherwise be removed by the cifs part of the netfs writeback rewrite.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: linux-cifs@vger.kernel.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 45 +++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 267b622d923b..f7455a579f21 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -130,6 +130,37 @@ static struct folio *netfs_grab_folio_for_write(struct address_space *mapping,
 				   mapping_gfp_mask(mapping));
 }
 
+/*
+ * Update i_size and estimate the update to i_blocks to reflect the additional
+ * data written into the pagecache until we can find out from the server what
+ * the values actually are.
+ */
+static void netfs_update_i_size(struct netfs_inode *ctx, struct inode *inode,
+				loff_t i_size, loff_t pos, size_t copied)
+{
+	blkcnt_t add;
+	size_t gap;
+
+	if (ctx->ops->update_i_size) {
+		ctx->ops->update_i_size(inode, pos);
+		return;
+	}
+
+	i_size_write(inode, pos);
+#if IS_ENABLED(CONFIG_FSCACHE)
+	fscache_update_cookie(ctx->cache, NULL, &pos);
+#endif
+
+	gap = SECTOR_SIZE - (i_size & (SECTOR_SIZE - 1));
+	if (copied > gap) {
+		add = DIV_ROUND_UP(copied - gap, SECTOR_SIZE);
+
+		inode->i_blocks = min_t(blkcnt_t,
+					DIV_ROUND_UP(pos, SECTOR_SIZE),
+					inode->i_blocks + add);
+	}
+}
+
 /**
  * netfs_perform_write - Copy data into the pagecache.
  * @iocb: The operation parameters
@@ -351,18 +382,10 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
 		trace_netfs_folio(folio, trace);
 
 		/* Update the inode size if we moved the EOF marker */
-		i_size = i_size_read(inode);
 		pos += copied;
-		if (pos > i_size) {
-			if (ctx->ops->update_i_size) {
-				ctx->ops->update_i_size(inode, pos);
-			} else {
-				i_size_write(inode, pos);
-#if IS_ENABLED(CONFIG_FSCACHE)
-				fscache_update_cookie(ctx->cache, NULL, &pos);
-#endif
-			}
-		}
+		i_size = i_size_read(inode);
+		if (pos > i_size)
+			netfs_update_i_size(ctx, inode, i_size, pos, copied);
 		written += copied;
 
 		if (likely(!wreq)) {

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

