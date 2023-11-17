Return-Path: <linux-cachefs+bncBDLIXLMFVAERBB5R36VAMGQEFC22IXI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA4D7EF9BC
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:00 +0100 (CET)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5876e3b42d7sf481353eaf.0
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255879; cv=pass;
        d=google.com; s=arc-20160816;
        b=UT4RK9p7xlGwbwJjZqKeX0iCrUTPJ+P68Q5s8i2GnXyq8fDwG/su/w64b3eFSqDwjo
         jlLcif2fo69xus8vHA77MFj/lkjZsqepb9I4NPT/8UTwcmrFBOCo71L5+MXhsEbFzXoc
         iRMGaVb8Bk+LJdQUwEdIV0LCWwsKNXxz+uOEMaYQBQtOvgftHBf6o3PRijXXSPhPEl38
         heeZ+yE+XCbGRGjs74wV5uAJjd4ohF9Gk2tThUGHnSS77k8voNQveo/zr8jeAKRY1a06
         tYh/YdCg+Kf5XJnQyUnkW+ernYLi3mVILtMjD6Z+aii26IM0kd9lu9h+haBcvEpsZldW
         kvaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5IFZafkHTdUxgqT6cgJ13fa1z1PHp/LIHCmEEc7zZFE=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=0eKTsolbJLJsJft34+jDpJUKJRuRfmFYxB/izI8ZPPqjlf8zyBTGBMfcK44nPacla2
         G30V1q1TLe0nbahDzJJEY3mQ/pHYuvCvlWIT6N4HdVuAxDF8GhRAOGVEifnO98snENNz
         nCqTmlEqbifV0yz2XZAUf1s46VoSJ2FJ+J/k5Hb0QfL8zcxDzwC1zTKuQqTjLgkR6Vot
         c0fsNOBF5ep3MDOVrKltrms7ocnNWlPeTu7E8Efv3/olQGJRDmCHf9JcP2c5Zw1gEJrS
         vJ/QL/FUMoejkEHFsQo1hPa9H5gGjgu/287bR3r/yAKqYZ4caWK5NPiZsJJKkWoBhel/
         ky3w==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255879; x=1700860679;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5IFZafkHTdUxgqT6cgJ13fa1z1PHp/LIHCmEEc7zZFE=;
        b=UU85YgVaC8MMuFFmFImGwfPiwQB1of3/NyB/flFwTVlB8AYeKsTFLzbeOrnHHjIJYu
         QZsQZt2Q5iZJwHhENoSgc5OiGXwgysC/AxaMZRcXfGZ716u+dWXh/8gusM7dSBxb0ooM
         XSVGlLvG0AhH72VpKq0sj9NOMOYb3vWE4Lkfh2H8pfgHmiZXeM30oT/bfAlo5bnccvBQ
         nc9wd4nslFazVL0iEHIVJp6NdLQHuYS39LL7aWj2C7ltu9ReBb9puoNoEVmj1WGfsUHk
         Xu6Wf2nrHznZffXp9poBqki7p4RIqv1Va8JGPzLind1iIliF2tlQXd/YdlCgKYEIMlmb
         +cfQ==
X-Gm-Message-State: AOJu0Yxyw+wsQhIPnotOZWv8ZlcsbwIrgfmldVOWw8JA9XM82HwXD5VD
	E3C8i3sTmB1C+6eDHyjKbJ+7CA==
X-Google-Smtp-Source: AGHT+IHJjFos1ExQKlHnMVfjtk7L30B9+ZXpauBZCoxqiC1xfIRapCnPD5ngfOkBezgUg7gyIiia0A==
X-Received: by 2002:a4a:d44c:0:b0:584:1080:f0a5 with SMTP id p12-20020a4ad44c000000b005841080f0a5mr841839oos.1.1700255879399;
        Fri, 17 Nov 2023 13:17:59 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:5850:0:b0:58a:758e:d0b5 with SMTP id f77-20020a4a5850000000b0058a758ed0b5ls1456782oob.0.-pod-prod-06-us;
 Fri, 17 Nov 2023 13:17:58 -0800 (PST)
X-Received: by 2002:a05:6358:7f10:b0:168:e7aa:596c with SMTP id p16-20020a0563587f1000b00168e7aa596cmr503289rwn.19.1700255878672;
        Fri, 17 Nov 2023 13:17:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255878; cv=none;
        d=google.com; s=arc-20160816;
        b=vOBeTdwAWEMvnIILIKHLL5G+HFWdbmEqLpH9tfiT9CXLuazNO2GHnl2vNO/TLoFIqS
         xbENmGXpCBtg1gb/yGV/rj+T8P4XGvqUG5L7RRNlAbTD2zpHeLC+8DF/95BAe6pRxTCT
         nZbPdDFkrfVl9T3PYvQeAkWDpBlAVrPTdkiqyQHqd1SOT1HZjfbOTs87b0QE/ns7KLla
         83KrrPRmLzdt/hMK7gezkTu+7opKKpQ9WN98C2MlYD9HsCa34pZPG0enWH1EmRSS4GO+
         pyr2pT5I2TLFNn/sDX44gfmOgcSYElgGjvbAqyQ4tk1Mj0DRqH3vrYwJFCOLzV99nZRI
         ZVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=yJ0EH3j50U389igBFANhTwAFPV4cR9SbiJMpaWBP0sQ=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=y+ynUhW5ah8/pfZCEdJ+D+cocMMW8uaSHJf1D7j9P6Ip10f+iznIGtls6/GUYRY1ne
         1bjY6H1IVRAgGsF0SiZk5MOrOUwHnVK4w8HLcipHIvrleL4bMKXJ3VMzL54EtMJtHYM+
         +rcrbxG9BnOXA0U1psKM9FKTTGTac8C+SlXsi4aeHAKUN+GL7RxQQytlzUn1x6u9mdOZ
         tmVlAbo5rZBep1eYFMFHavZOP1z2VnXxx8UMF7rEwZMP3b1rvw5pbplj0BKNelmQCQl1
         dWhbSN/Ru5s75kL85kW1J7teNmUfu/grxI5If71Y2Rv5DXUwijjDsL2a73Sl5bhOk5BK
         b9rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id cv7-20020ad44d87000000b00678006594e3si20202qvb.397.2023.11.17.13.17.58
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:17:58 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.61 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-sxXaJAJLNpajAXIA7LfCBQ-1; Fri, 17 Nov 2023 16:17:57 -0500
X-MC-Unique: sxXaJAJLNpajAXIA7LfCBQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C07E381B567
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:17:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id BCD38C15885; Fri, 17 Nov 2023 21:17:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B871C15882;
	Fri, 17 Nov 2023 21:17:54 +0000 (UTC)
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
Subject: [PATCH v2 32/51] netfs: Make netfs_skip_folio_read() take account of blocksize
Date: Fri, 17 Nov 2023 21:15:24 +0000
Message-ID: <20231117211544.1740466-33-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 205.139.110.61 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Make netfs_skip_folio_read() take account of blocksize such as crypto
blocksize.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index e06461ef0bfa..de696aaaefbd 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -337,6 +337,7 @@ EXPORT_SYMBOL(netfs_read_folio);
 
 /*
  * Prepare a folio for writing without reading first
+ * @ctx: File context
  * @folio: The folio being prepared
  * @pos: starting position for the write
  * @len: length of write
@@ -350,32 +351,41 @@ EXPORT_SYMBOL(netfs_read_folio);
  * If any of these criteria are met, then zero out the unwritten parts
  * of the folio and return true. Otherwise, return false.
  */
-static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
-				 bool always_fill)
+static bool netfs_skip_folio_read(struct netfs_inode *ctx, struct folio *folio,
+				  loff_t pos, size_t len, bool always_fill)
 {
 	struct inode *inode = folio_inode(folio);
-	loff_t i_size = i_size_read(inode);
+	loff_t i_size = i_size_read(inode), low, high;
 	size_t offset = offset_in_folio(folio, pos);
 	size_t plen = folio_size(folio);
+	size_t min_bsize = 1UL << ctx->min_bshift;
+
+	if (likely(min_bsize == 1)) {
+		low = folio_file_pos(folio);
+		high = low + plen;
+	} else {
+		low = round_down(pos, min_bsize);
+		high = round_up(pos + len, min_bsize);
+	}
 
 	if (unlikely(always_fill)) {
-		if (pos - offset + len <= i_size)
-			return false; /* Page entirely before EOF */
+		if (low < i_size)
+			return false; /* Some part of the block before EOF */
 		zero_user_segment(&folio->page, 0, plen);
 		folio_mark_uptodate(folio);
 		return true;
 	}
 
-	/* Full folio write */
-	if (offset == 0 && len >= plen)
+	/* Full page write */
+	if (pos == low && high == pos + len)
 		return true;
 
-	/* Page entirely beyond the end of the file */
-	if (pos - offset >= i_size)
+	/* pos beyond last page in the file */
+	if (low >= i_size)
 		goto zero_out;
 
 	/* Write that covers from the start of the folio to EOF or beyond */
-	if (offset == 0 && (pos + len) >= i_size)
+	if (pos == low && (pos + len) >= i_size)
 		goto zero_out;
 
 	return false;
@@ -454,7 +464,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	 * to preload the granule.
 	 */
 	if (!netfs_is_cache_enabled(ctx) &&
-	    netfs_skip_folio_read(folio, pos, len, false)) {
+	    netfs_skip_folio_read(ctx, folio, pos, len, false)) {
 		netfs_stat(&netfs_n_rh_write_zskip);
 		goto have_folio_no_wait;
 	}

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

