Return-Path: <linux-cachefs+bncBDLIXLMFVAERBSNYS2YAMGQEL72GMTY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id AA24589054D
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:35:22 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-430ac211fbbsf11654571cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:35:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643721; cv=pass;
        d=google.com; s=arc-20160816;
        b=u0R5ysXpE6inHz6Bqs10XDARq2dUPpCuiwlp61pC2grnum2vvOShQ6dC7O1yb4zbXK
         BjK1iHUXaXX6AdZ+RV2LHz+4V7+kkUQSAf214Pd6HPiPqgHlEQ7IRPToz4wKDq4AKXqc
         QOiz/syj1yrARGlTD5ccdyn+h3/EVjcTNGP5fcGjpZdz11RT9NsURFrKU07HLd0wEq+G
         WWycgyrhugsoBc4PV5x0VeTZoO0jE0tNjydcLcZC5sWDbyUSc7wowR9Vprfwb3y6GBOp
         AKk9n7lszI9a4CQ0knfiICRUWgKYVaW/1+a2U5xjEZGMLyycYpHaaox4S8ZVwHPQ0SZE
         b3gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=6B4/WPfcpCWitYKBs7MXvL/6ebKOGLE/KoGEEskXuf0=;
        fh=m7wICq9AsauIwzJ6zSAnw9tFypw1aXw0BeMYZ39dy3U=;
        b=U4Jjw33+SFvC8bBk95kD942H1gW5UZts5l9XS40NXnIrcSpVIcpcJykSlTmt6kEzKB
         cIEZW77IR5JTlrXrJ8AHKko35o6HCnInCqdErnYhuUMqszRkEDS+BXnoi29rztfNN/bt
         aj7LFRyZMYZH+vPurJ7nnj3F23lhGedHnYTL7fyzh2BnSRda2aMR8gP3gx4hnbJxCRae
         ewSESbuPNmd6HZlZYyqW+1L0hEM59L14lTdLeDFgfPPgjkM5Wt5GDFPaHKyD8BtrJMnJ
         mKuB2VwE8mfHMq/cbnomDo2w57FwYiVcJ+mvwnXkpkGChc7WbYHqy100eL2qp2KuwH2T
         fugw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643721; x=1712248521;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B4/WPfcpCWitYKBs7MXvL/6ebKOGLE/KoGEEskXuf0=;
        b=wNhVhRT9fRQtSTKdnEEDdd9WnNv5TwEKVhWJRpfI/keb/9g1e8cvRxkRTyJbL4NTQy
         bWvZ/5P8jTs/svJIKO5eWlfFd8PMMLMAUjU7NDFGKvlKxFU3a6VXs1l3yZvOlAuRqkj5
         1nY6QFVsle0tZe59Rcl/9nKFHh8BAaKuu85s5vGHEdOSAtxlxxNK+bJnzflY/cfPJUe0
         OLUWUweacmARTfsqYTfyK9l3defV2p1w8DEWoZ62+um1GSdh4QQxGbVckdpvV1BQSULC
         7oCCSWesf2JWAHO7qt5JM9ELDZe1Z6vopmOsU7HQlA9N1HJlOpLYd/xNjgIu79KaChNb
         L4Xw==
X-Forwarded-Encrypted: i=2; AJvYcCXmitoXrMJ8a2mK79j3i/KplGQE21GHvRIajEL6NH+M0u0Kyl9v/SmC85sPOe8Y5rqcs9Wh5YpGCegzEjODMKNfIz0Z6C71BdXg/K4=
X-Gm-Message-State: AOJu0YzlTTYxlW2Lyk1AwEqbKh3IymU3suvmLME84QiCy5sIGQoj8wFz
	wK0J+hbrwqvRgI4HVokS8FfzpsAf4l8kjDu/Cwf4U+ibLaWkHDPnxPjZ55jK/A8=
X-Google-Smtp-Source: AGHT+IGWoPCHQYW9mAqvUlBZURYkMaxgYyh0yZjy2w/SkZ5Iealnn7IgO6/HT8/xce2jizdBl/byrg==
X-Received: by 2002:ac8:5710:0:b0:431:5b06:c2ae with SMTP id 16-20020ac85710000000b004315b06c2aemr4399292qtw.56.1711643721482;
        Thu, 28 Mar 2024 09:35:21 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:45c5:0:b0:432:b2f9:64f3 with SMTP id e5-20020ac845c5000000b00432b2f964f3ls958204qto.1.-pod-prod-01-us;
 Thu, 28 Mar 2024 09:35:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXOsw3WhqinKc7Xw1kIK67tdAaK5B+7I3OqD1OacSMnqvHTbMO0/HV7sdIeKOUepQh44TG7nJoukAzRGdc72MwOAdHYGA7sujfMA+9La8c=
X-Received: by 2002:a05:622a:1756:b0:431:60c3:7854 with SMTP id l22-20020a05622a175600b0043160c37854mr3654577qtk.2.1711643720703;
        Thu, 28 Mar 2024 09:35:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643720; cv=none;
        d=google.com; s=arc-20160816;
        b=08MSRPCPDPo+rXUU+8HTDoeRTnHAwwM6p9czIFwyxXyfIuTNLcLIYrEbiQuhZkD5Yg
         K8elPcy/yFYV8coMu24shvrnPYxuGujh+M30crarqa7se/zWgHZV+bZ2bJoFX5JaYjPi
         y3S0eSItAh9nXJA/bwuvXzxH/XKcvrX1cJ2hUPOpvqWtxDfFDiUSzx9kj9x9Gs0ZyFlp
         4bLaLhnC//BKe2C6OJr5qBhFGG98xSEGdZyUZHAWdG/WSBAAmsEt77WTeapCKUrGP/Ow
         MKo+7zwZSnsogOt/z/KvMepE168b/9sWrZAR4LOpa7yR3ZPUB6ITcbB52def6Xb+Uor1
         IJ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=iDQ5YQkdeqSX7Pu2NIHjg+k9McupuXq1Cg/hmfvmEVE=;
        fh=D72SRyTeGTT5e8cHVnWso1+T4PfZOoBdL/zxY6by6YI=;
        b=bVIUAktvm1Z3p4Of/AYElj8Ql9IaIvBXki7HaRVo0YbnkqHBQFfuVCUKMjxd3uy2iH
         DA17bdO+TtNn++ENMjHAev4KXKBRxhAzJ8TY3UI8wLoQSXnxvvbz1zLmF0GUY7aa9E6p
         KNzRkp2kpUxZWA3PpRWrWB/h3e3vra9mWGhp5MjcmifflezjPCA6L86Do1BZvxLYE/3O
         8U2Q15A922VLVXXXqO0f5cEpLv497Ep4YSEXs2vuq/OZ33vbfsEA+CoxN/FEyY88ATUH
         /XemHupnixU1T5O8pdtojQQYzlBKC24tZyXhgErMzlZ9rf4vl3A+1a4NUMsji36YtpDS
         HwYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id f10-20020ac87f0a000000b00431849a1f8csi1806242qtk.40.2024.03.28.09.35.20
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:35:20 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-219-caIjdT59OX6KuDPlVCYcYw-1; Thu,
 28 Mar 2024 12:35:15 -0400
X-MC-Unique: caIjdT59OX6KuDPlVCYcYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69EA128B6ABC
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:35:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 664C840C6CB8; Thu, 28 Mar 2024 16:35:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EEF1E40C6CB1;
	Thu, 28 Mar 2024 16:35:11 +0000 (UTC)
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
Subject: [PATCH 03/26] netfs: Update i_blocks when write committed to pagecache
Date: Thu, 28 Mar 2024 16:33:55 +0000
Message-ID: <20240328163424.2781320-4-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 45 +++++++++++++++++++++++++++++----------
 1 file changed, 34 insertions(+), 11 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 9a0d32e4b422..c194655a6dcf 100644
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
@@ -352,18 +383,10 @@ ssize_t netfs_perform_write(struct kiocb *iocb, struct iov_iter *iter,
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

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

