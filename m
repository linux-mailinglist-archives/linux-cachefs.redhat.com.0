Return-Path: <linux-cachefs+bncBDLIXLMFVAERBJNYS2YAMGQENE2RDDA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B389053F
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:34:47 +0100 (CET)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-60a4ee41269sf20896237b3.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:34:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711643686; cv=pass;
        d=google.com; s=arc-20160816;
        b=BnhA1X+hlm4y/jBIF/Q5nC7UkXCioYb7aIopkMVo3PNiFnUlh3IrjwAmCiPAxPk33w
         TPm635GWBEq1MWQ9sQhPUPdduwCjAz6AvDq6Tq8MLltIf2gV0UoP2m297leGbeXkuuoc
         zzbUUYY4Pbqf7Q8Ego0tGR33DS4dd0SgJwVzqKkvcPGZEavHYVcK+VWhec2mD//McBcb
         jIOCreb9CoOs0Z74SwlXmKUOgP8HNODx9U2yZoxuDtQDu23lsiGMpIM5FOcN0VD9SKDv
         a/QGprcYAFskDB1xim28JEPxy6dKOcfkR9BtnkzcXtoWdexEcQdQIt/UrzQvhYXLORx+
         YH6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=U8eL0y6PqvWlwX4ddYKKz4Hzqzt+Gj2MtwfNGGmrbI0=;
        fh=04uJLkIOjppqhSOUp1f31tm0hzB3dpr4E1cHAPCPGLk=;
        b=HYOvplI94Mmsf+nEvCJkTJwjP2+ADDvSHzoDC1rIqzxh74IW1V7ZaEqvKKiigzUfGV
         zdqkKN1EEBmjMabXTj2BMmBswfzDmLoZvFa+5dl3MlBnujajjrF9GXZldhKsLp91K6Aq
         jDhNVCfdo8euI7MxY6xp8zsVxNmUvNPVCJueFIxHkihzTgouRLwlieVD9E39cC4H4oC0
         XxT8I07knmVEJPqQI1n2m2ANwwlAzmKLp0nCC9044oZfnurnVk9AR34KuiogXnyeglNW
         /7N9PvtfTFZisVB7o8ZF0S+uNR5ginmHkf2uZwSWGfKWOCRJ1c3SvbqPj4VhDAqyFTUB
         VnLQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711643686; x=1712248486;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8eL0y6PqvWlwX4ddYKKz4Hzqzt+Gj2MtwfNGGmrbI0=;
        b=uQAqMbCxvZhEL6hPJIgqf+/PYpwPc88vx4/l/mwCex5ZHZ6oKTHkVdNmGny77wy5fM
         KcuGT00QnQgFYE1sF4UF36UZR52CMPfy7pRTP2y2v1UvBF8GLhdvLqVzb19XULQ60CuC
         +NATKUbFKhNzQ96eyLMbQxoIVA/9AOSbm71hGQFXXb2cv8wfwYpVpx2rVfJ0tH0QHKfA
         ngIySoOIEmoLIJwaGdzoh2RJY4S8E4wSz/wBsF2Btc5WU6wYnk9hiym/xl1uhS8PFz5u
         4qk+IYL/9rRP+7n3td+f4MD22dgT/xieHQ3uPUUaW02cy+w6Z+i9lmksNJq8v/9hqsJI
         VpMA==
X-Forwarded-Encrypted: i=2; AJvYcCVfM1NylrLVa/5nBfWE1jSXSLejKucOlb4stF5/NKpMgHUVf9tLeKhMrQFGbSXbtzTvKDUzruMRV8WVFsNPa/eZhwXr/G3wqMmeNvc=
X-Gm-Message-State: AOJu0YzF7oPRmuFYd3pJsQejxv9AQyu5UIVrEEzeAerx40AQnuKDVS5k
	rvvHwwVIasBAePSK9RP2k39tyZ/Wa5sjqlLYWZl/vyL6qWzU9GPmRlep8qddRXw=
X-Google-Smtp-Source: AGHT+IE2qjrqXPnkuCTJfl/egzPWNWbmPuUOSFv6Gqj4R3Srh+JGILaXNqNzSNGVgqpKKxKwMI07ig==
X-Received: by 2002:a25:ab2f:0:b0:dcf:288e:21ca with SMTP id u44-20020a25ab2f000000b00dcf288e21camr3580474ybi.11.1711643686051;
        Thu, 28 Mar 2024 09:34:46 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:dcc2:0:b0:dcc:4b24:c0e3 with SMTP id y185-20020a25dcc2000000b00dcc4b24c0e3ls1580148ybe.1.-pod-prod-07-us;
 Thu, 28 Mar 2024 09:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgcciQPXEidNb+qI4H6qgmoGtGR7dq9U0uFAoP8fVe1QouQBpZNDZo5w7X7FxYPAf9jNPkfi6Hx9Lt3UFdyBimVcPNWXSuBb23KapVtdI=
X-Received: by 2002:a0d:eac9:0:b0:610:b933:33a1 with SMTP id t192-20020a0deac9000000b00610b93333a1mr3310708ywe.52.1711643685294;
        Thu, 28 Mar 2024 09:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711643685; cv=none;
        d=google.com; s=arc-20160816;
        b=MT2N5+NsCp+lmbVB/NjAfxrJrn9qnbDHvzOBFH6G8D1LkNz3dXPEcITLcmUjYRD1US
         0E14LAbLVA5I2w1CVe0hEIFcazi4Vz/r3yH/Ec+DquM5uxTUqQnCe6fsqSHCmXfe/A55
         NUWchFuPildwL3VJt3Y3u3DPx0PBwrUnvo/V/nrIXlm4duxI3m57joPPqwiXCLm/+Vhp
         YztaJm04HcjwsUb55SZU/hmQF+4BHrWs0ZfylbwVshbjzHrgbHmRwaAGZMfZIktgD/Ej
         gWtMaZAGFAVSb8emryuJdvBJx0z6kzJrobU7wECSn5CcWb2uJhbkfhIvHWz47Z8eQqYm
         Gy8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=UGun0xTYAiYXpHAgnS9fdzLLkhmr8x7z9WYy+PlL9DM=;
        fh=D72SRyTeGTT5e8cHVnWso1+T4PfZOoBdL/zxY6by6YI=;
        b=Ygw5NhMSwTg4LgxAYbNhjoB77chJ/Rhjr75Q4BmoPsvqEGfHWgyELRIhJhonOlgPzJ
         a/+ZpkgMGlOZJ4tbFArMt3C8hh/7QsdXlweCbJVCd/kOGLOpzcz1VlWho2qw4g4RFVBn
         FfciSKWv+d8LiZmFBZHPGhoinQRjv3aO4W/cdNT7fEQ0rpSowygtNzfNI69+t+jM8Eju
         kkTU9veTsJszP8mno8isOXyhSzxOK3HkzQYX8tZ4oaJo53HecBnu01qcILSlCVzOs22j
         cY2HO62WOkUm7uBCSe345ApYRl2uqLG1jbfBf7QN4n3x6fKT80u4qMmovC1ca9GPrO+P
         /NMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id k23-20020ab024d7000000b007e10fad9571si283157uan.7.2024.03.28.09.34.45
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-131-1mqqfuETPqWBdNuulVUL8Q-1; Thu,
 28 Mar 2024 12:34:43 -0400
X-MC-Unique: 1mqqfuETPqWBdNuulVUL8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 443173C0BE47
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:34:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 40A2817AA3; Thu, 28 Mar 2024 16:34:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CA93D17AAE;
	Thu, 28 Mar 2024 16:34:39 +0000 (UTC)
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
Subject: [PATCH 01/26] cifs: Fix duplicate fscache cookie warnings
Date: Thu, 28 Mar 2024 16:33:53 +0000
Message-ID: <20240328163424.2781320-2-dhowells@redhat.com>
In-Reply-To: <20240328163424.2781320-1-dhowells@redhat.com>
References: <20240328163424.2781320-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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

fscache emits a lot of duplicate cookie warnings with cifs because the
index key for the fscache cookies does not include everything that the
cifs_find_inode() function does.  The latter is used with iget5_locked() to
distinguish between inodes in the local inode cache.

Fix this by adding the creation time and file type to the fscache cookie
key.

Additionally, add a couple of comments to note that if one is changed the
other must be also.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: netfs@lists.linux.dev
cc: linux-fsdevel@vger.kernel.org
---
 fs/smb/client/fscache.c | 16 +++++++++++++++-
 fs/smb/client/inode.c   |  2 ++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/fscache.c b/fs/smb/client/fscache.c
index c4a3cb736881..340efce8f052 100644
--- a/fs/smb/client/fscache.c
+++ b/fs/smb/client/fscache.c
@@ -12,6 +12,16 @@
 #include "cifs_fs_sb.h"
 #include "cifsproto.h"
 
+/*
+ * Key for fscache inode.  [!] Contents must match comparisons in cifs_find_inode().
+ */
+struct cifs_fscache_inode_key {
+
+	__le64  uniqueid;	/* server inode number */
+	__le64  createtime;	/* creation time on server */
+	u8	type;		/* S_IFMT file type */
+} __packed;
+
 static void cifs_fscache_fill_volume_coherency(
 	struct cifs_tcon *tcon,
 	struct cifs_fscache_volume_coherency_data *cd)
@@ -97,15 +107,19 @@ void cifs_fscache_release_super_cookie(struct cifs_tcon *tcon)
 void cifs_fscache_get_inode_cookie(struct inode *inode)
 {
 	struct cifs_fscache_inode_coherency_data cd;
+	struct cifs_fscache_inode_key key;
 	struct cifsInodeInfo *cifsi = CIFS_I(inode);
 	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
 	struct cifs_tcon *tcon = cifs_sb_master_tcon(cifs_sb);
 
+	key.uniqueid	= cpu_to_le64(cifsi->uniqueid);
+	key.createtime	= cpu_to_le64(cifsi->createtime);
+	key.type	= (inode->i_mode & S_IFMT) >> 12;
 	cifs_fscache_fill_coherency(&cifsi->netfs.inode, &cd);
 
 	cifsi->netfs.cache =
 		fscache_acquire_cookie(tcon->fscache, 0,
-				       &cifsi->uniqueid, sizeof(cifsi->uniqueid),
+				       &key, sizeof(key),
 				       &cd, sizeof(cd),
 				       i_size_read(&cifsi->netfs.inode));
 	if (cifsi->netfs.cache)
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index d28ab0af6049..91b07ef9e25c 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -1351,6 +1351,8 @@ cifs_find_inode(struct inode *inode, void *opaque)
 {
 	struct cifs_fattr *fattr = opaque;
 
+	/* [!] The compared values must be the same in struct cifs_fscache_inode_key. */
+
 	/* don't match inode with different uniqueid */
 	if (CIFS_I(inode)->uniqueid != fattr->cf_uniqueid)
 		return 0;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

