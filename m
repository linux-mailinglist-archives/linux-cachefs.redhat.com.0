Return-Path: <linux-cachefs+bncBDLIXLMFVAERBLVYS2YAMGQEIKX4WRY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B19890542
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:34:56 +0100 (CET)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3c3ecbe480esf436880b6e.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:34:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643695; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z4Nq/eSwjloVuoS1CH9NOMZv3sVoZF5xKq6H2eQO7BcfyeWCQVtQYg1UCZxkUWH6Of
         Xs5JqmlpBWk8/AnuaiXWwyKDja4T6609BL+qgkkbbFJ38pCS5azptF4hpsDicEdqmwzN
         pUUk5f7zr1ii9Xfr5A4maRvPEodh/uN9Ai80q4GX2MMBIjd1Q1wagzEApd3jdU+ASxVw
         g3e3pD34ry4G1Tey1tTUJrxEso+ElmG5FV7Q5GOx54KPlH9Cu5RiVldRi/G1ITJpolAW
         vmz4aOdyGL6LWGsXoLOxoqNa7lkMFPKmFkgqJKxc6jfPEMMwcODlerkmdrUTXemdEeQp
         GVCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=OvofIxxolfBIEpxBRbIDHj3Wd2hl+GaAdcJNsyTQV1o=;
        fh=3kqFsJZpXEnzwu5D7CKsULgGt8xI6BhpQBsIzVNkp6I=;
        b=03vfjrXQFZg29htdogA/AA3L3H+2GlvKWscLNpG4rFVDrg4pG43W4LPGI526+qHWfV
         UPfDgyUBs78hZO2HuSJcW0PfIUkGyMy3aXZ0PyFWQl3CLhFI53VRftyZtVM8uV07As+S
         Cs+Rt/dWcWEr3efVpDl8jn9tGYKjKnXfsCZwWOZikkBYWrUpP/sMrtbZj2TctDE5WYp8
         bJGGlJpumabO6KUGU6n+I9sa/FC4ndXQ7lC8Vptzy+JONs11nkM3GrAD0bV7QGrU+AxX
         usAluqod3lHnM0r820eBiKFCAjnNGYWagNidZkV/dwZ/bIJQO5bnLGirTUOlZIWMgPAD
         epEw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643695; x=1712248495;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvofIxxolfBIEpxBRbIDHj3Wd2hl+GaAdcJNsyTQV1o=;
        b=raqKSpSUbBCEgSPJSACv1+7ezpw6/YFZYWcywJp+spm4MYAwguwdbuXVsIUa/9JWfB
         39ydThg2FTCKZGjtNUOsMQ4N5qFotef1QC9K1ISrVwXPa3w0DgzZ6EMcEHdBhACixyck
         IDgNcKtd2eLeBGMY3/l4aX9c1R22osEWiMH8+3rfukDDuFe8YuSm98A5QeSPNYIGmkjH
         Eslh/BOq3NLIHs7fPl0+CnUaWz5vpmAD7kxpJqsBYbcZY6sYpBazBsN9PVDQstEVUWdl
         rdiwgVCBKoc2KY0RIQYvYEsdAye3YjT7G2aoWxCrTe/xaamB5YC1YBV2lh/VofRqGSI2
         WBoQ==
X-Forwarded-Encrypted: i=2; AJvYcCWoIJTzUNNJzl23KrIOZo82/Q3pNaPdRmtkkQf9zeudDfK+pjJPpLN2G+gCDbrVkgZdDK7UAqBaM9db06rN0JVLuB663I7tSUTCfqM=
X-Gm-Message-State: AOJu0YyvLNNuHpm7aLfjRfvWA7qpXAcpF9KsKD60eSVg5jnGJITGVV9E
	WI/6tponMTFubFZ7KhMvNmLU5h2b3ZMoDJZgkbkO5QJOjJh7EgAHkWbwZju6QFw=
X-Google-Smtp-Source: AGHT+IF7ksBm0Nf0dzseh7TIYReBnD307h3Mvi6YuoT0vPuAUN59AToa7R6e4mLDQoZsg0+67n4rEA==
X-Received: by 2002:a05:6808:2f12:b0:3c3:d39d:a596 with SMTP id gu18-20020a0568082f1200b003c3d39da596mr4774250oib.26.1711643694899;
        Thu, 28 Mar 2024 09:34:54 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5c8a:0:b0:698:7a54:d877 with SMTP id o10-20020ad45c8a000000b006987a54d877ls892830qvh.2.-pod-prod-05-us;
 Thu, 28 Mar 2024 09:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWr8iqQKPZiuTOyo3YrJu+OMZckvcsbOqjw+rbESPLyhYpMtUT4IaVO1dgZgjli8+abL7vBnR6gYkjyWoksNJx/qnpGVB58CtkD8cKwEbs=
X-Received: by 2002:a0c:ec02:0:b0:696:a4b5:fcee with SMTP id y2-20020a0cec02000000b00696a4b5fceemr3430311qvo.1.1711643694170;
        Thu, 28 Mar 2024 09:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643694; cv=none;
        d=google.com; s=arc-20160816;
        b=k9IxMuY7k/d5PIcaxlMUnPgsD1nCwscWgVXjgcJqesSLe/Rp4WdOFy/r6MYEI2WKlb
         HhxGFVlHGuy39ovKdbxMbAHVdo3Y3stGRK729bEFP6C2uyc0Us6C2913cHBo5vCJNfim
         /OvN49b/5JbDcLLKmRnkgM5iFJQ2TpBYNpawPyEmdwH8YlCri/wbWNo3g1ZxBAK6rb/G
         +Ju5ouGCKOCIPUrc1EPanmOfg1WLHaQKXbXHzBG25PLgwBWCmWl/W56qRZw7Icu4liNb
         iv3LDisYrPhOyaROa8rDMI28CMLoF60l6hhh8tAU42vyE9J+rEr30qZIKcwLVWzx23up
         q+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=hDfAk4YAlKNdLmSwUMxTH3zTc83Y1JZRxoVOBJSESsg=;
        fh=MRByWdGD0e7LCOwxmXv5cYQpukVa0xHJcjZh5lBl/ic=;
        b=L8Ga3yCuWUBrxAlPBY6T7HVNg8OX/zQrHvGWYPwuvqzYzqnfj+efXoiZvuyq2IpKX2
         Q3ThAvtyMp8e/ZQTpLrffq9sbACa8JS0EfnUskFlC/BbR8uAd/gPlZsWrp8lsQ6zxlqs
         J6dg0qRmIvbkzglOtpaJTtrHmmA3cYo7McFubMKYwwiHZsZOGm8vC4v71NLOOMej88a6
         b9FNdPN7vHg2FZcXP+LGgyEfiIdY7mKB8MpXknxnhdzjZsj34shWbb/fpebXbXfhHGsj
         iKU29Bmt2566jw2PCtfa7q8AVczKIEmN7KApaYnEaW9kKz4oigSlHs93YJ2ZHkmyPiVn
         6/Fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c17-20020a056214005100b0068fe276cf6esi1678902qvr.330.2024.03.28.09.34.54
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-Q5l7Mi1AP5-_Jey-ePxGKg-1; Thu, 28 Mar 2024 12:34:52 -0400
X-MC-Unique: Q5l7Mi1AP5-_Jey-ePxGKg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 489F610189B7
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:34:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4486A492BC8; Thu, 28 Mar 2024 16:34:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA9EB492BC6;
	Thu, 28 Mar 2024 16:34:47 +0000 (UTC)
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
	Latchesar Ionkov <lucho@ionkov.net>,
	Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: [PATCH 02/26] 9p: Clean up some kdoc and unused var warnings.
Date: Thu, 28 Mar 2024 16:33:54 +0000
Message-ID: <20240328163424.2781320-3-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Remove the kdoc for the removed 'req' member of the 9p_conn struct.

Remove a pair of set-but-not-used v9ses variables.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Dominique Martinet <asmadeus@codewreck.org>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: v9fs@lists.linux.dev
---
 fs/9p/vfs_inode_dotl.c | 4 ----
 net/9p/trans_fd.c      | 1 -
 2 files changed, 5 deletions(-)

diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index ef9db3e03506..7af27ba1c25d 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -297,7 +297,6 @@ static int v9fs_vfs_mkdir_dotl(struct mnt_idmap *idmap,
 			       umode_t omode)
 {
 	int err;
-	struct v9fs_session_info *v9ses;
 	struct p9_fid *fid = NULL, *dfid = NULL;
 	kgid_t gid;
 	const unsigned char *name;
@@ -307,7 +306,6 @@ static int v9fs_vfs_mkdir_dotl(struct mnt_idmap *idmap,
 	struct posix_acl *dacl = NULL, *pacl = NULL;
 
 	p9_debug(P9_DEBUG_VFS, "name %pd\n", dentry);
-	v9ses = v9fs_inode2v9ses(dir);
 
 	omode |= S_IFDIR;
 	if (dir->i_mode & S_ISGID)
@@ -739,7 +737,6 @@ v9fs_vfs_mknod_dotl(struct mnt_idmap *idmap, struct inode *dir,
 	kgid_t gid;
 	const unsigned char *name;
 	umode_t mode;
-	struct v9fs_session_info *v9ses;
 	struct p9_fid *fid = NULL, *dfid = NULL;
 	struct inode *inode;
 	struct p9_qid qid;
@@ -749,7 +746,6 @@ v9fs_vfs_mknod_dotl(struct mnt_idmap *idmap, struct inode *dir,
 		 dir->i_ino, dentry, omode,
 		 MAJOR(rdev), MINOR(rdev));
 
-	v9ses = v9fs_inode2v9ses(dir);
 	dfid = v9fs_parent_fid(dentry);
 	if (IS_ERR(dfid)) {
 		err = PTR_ERR(dfid);
diff --git a/net/9p/trans_fd.c b/net/9p/trans_fd.c
index 1a3948b8c493..196060dc6138 100644
--- a/net/9p/trans_fd.c
+++ b/net/9p/trans_fd.c
@@ -95,7 +95,6 @@ struct p9_poll_wait {
  * @unsent_req_list: accounting for requests that haven't been sent
  * @rreq: read request
  * @wreq: write request
- * @req: current request being processed (if any)
  * @tmp_buf: temporary buffer to read in header
  * @rc: temporary fcall for reading current frame
  * @wpos: write position for current frame

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

