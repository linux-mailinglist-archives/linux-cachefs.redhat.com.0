Return-Path: <linux-cachefs+bncBDLIXLMFVAERB74T62WAMGQEWX2DLAI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B09C828BB0
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 19:01:36 +0100 (CET)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7831580313csf416611685a.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 10:01:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704823295; cv=pass;
        d=google.com; s=arc-20160816;
        b=t3ADg6YfBWwYFtge9jDCEH6Xbz8ElMXG3M2eDTNRVFOXaIKRC8hXOB9fdwn9chB8rb
         hxqYqBu45j1cfMcZSTo24L0aFgkgYGcgePW2WwRb4uFXDVeHe2X4v1dB0lyL9GAnkLBI
         dRUfjCqw6/e0Z1IK95j9VhNlgrCHFlwYY0X4oEhmSkQieNkDge+xl0snPwfQKeAOjFiv
         5Q9swa8xMIVo4s7NbC+ILzkUaJ+EHjqOkHKh+cB5SHYYRvrilJLwdGjEN5eU2Wem9xJy
         /Xz6opnmUsm3oTkd9clf3qLiEo2ciNTZPbRqJERF3+DKjihYWU8Ek8SSdcQUkkNIZhxy
         DxJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=nc+FKUDzm5oNMmwU80GJv+SlHVl7NEeElowPQKu6lt4=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=DeH6jVQVmihtqHQBm3DV7W/bMZpG6oEp3EpMbR9Bi28X1APKsDSOXXDVfZVeIY0gIc
         PE/CJs56wvwoB50IIzavI0lggHDaoKN4weoP62L3Rcib9A4IM9LISYfrTlKf1j6ueNU4
         z4teFGOZS/JeJHtR8V3nnUgpgiqQbnBLdoU1ErE99aBnlOoS/c2QoXkdSUh9aeEbwDSv
         eEDtt124+oE7hvGMSwiORjTZUP9R/ncW2ZxlUoWip7wDNzJswtes+c+6+/37fAWr5ZeV
         CxX1BT0xjCEb7J+ar+ERGw8nqfoBcHYMoHpGHxOOYP47JbJDgFlyUzmRVb2QZ/kojb52
         Sd2A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823295; x=1705428095;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nc+FKUDzm5oNMmwU80GJv+SlHVl7NEeElowPQKu6lt4=;
        b=AOIBqHi5gA2E60KvYwhkZBkVKBg3WKiefubpADUc3yNQiOzN+A51BdNIbOr2PBCWix
         WOVqUorE4Si3xY6N3cMEO0cunTduaUmWBWwoCKCF62NG/OneVetUw9B75xeupqikyYHV
         M0OqWy8GKsLOYz9uuGbaOTtp0BvOtQYvtD6GIbNwJlbdSjhG2MRBTlUQ40/AfAkpdeD9
         GQL0pzJOG+Xt0VM8PAGE5b1uyrO0coRq+CEjxNKYfF/dDP46mI+LVwkE6yY1NmdPAHcq
         HM40kMEV3Q0l2xyh/xSDqn56/OycI07+jj3uasyk4bMWKfWK1TEg3iM2tMMvlkOZxg7O
         3m4g==
X-Gm-Message-State: AOJu0YyMCIqcjM3FFm4R8FWPh24t7K353zSjJeRJRMagWz2NCWG39y8z
	r6r8j353uXmXqhH8uvWsvKpJIJ17sl5KsQ==
X-Google-Smtp-Source: AGHT+IEjLmP+BUmo5aMKcrP0Aj/CTp54QY6RNeoOM3cSXZMMOP0sHGdi5lI3f2UaVNxjbllK+ZOemA==
X-Received: by 2002:ad4:5ae6:0:b0:680:b3c1:8f3e with SMTP id c6-20020ad45ae6000000b00680b3c18f3emr9435434qvh.121.1704823295389;
        Tue, 09 Jan 2024 10:01:35 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:260d:b0:67f:38e1:6983 with SMTP id
 gu13-20020a056214260d00b0067f38e16983ls2700869qvb.2.-pod-prod-09-us; Tue, 09
 Jan 2024 10:01:35 -0800 (PST)
X-Received: by 2002:a05:6122:d8d:b0:4b6:b917:13a9 with SMTP id bc13-20020a0561220d8d00b004b6b91713a9mr2743503vkb.6.1704823294846;
        Tue, 09 Jan 2024 10:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823294; cv=none;
        d=google.com; s=arc-20160816;
        b=IoyC0hGjS/au1Qk//v1t1xWXmeRGSa7mArdFfmN3xsMTkqpVhO1KiMWbMVecBai+az
         U2CqznhXP0XQ+VQ6OILqZB3f0/aDNo1tqCZnX5w2uxX89cNVwm+r2GXJZ6vvv34o4DA2
         P2eqdsw/VS35NRHfhZU+HTmOv+FGkuhlMZjE02QYxLO50V6g1dKRLV4dWBetO8MsIO6k
         OBr9gqtNV7oLQQTfDEX0ynJOnmhhJdnaNQ0kOwQ1kqMxKmStZnsd91rJXb5GchiPn/bu
         fNCkHU0HeNyoYFAP0ne+MvXaydBAK4b9wT1g+pjFCREBGtzQtXdgMAWUUCQM5rDrPbRq
         f2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=e4MRJOyXPjbNk2hR0Bl18LltS/kUEDv+XACveM0IT3M=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=S4UUVnykLqXwHg7CV3K+oZV23KaIp7iCYIgxDvuOBS9Y8NLEZbZlno4BBrAVg43Kb/
         woXNpU/Ju00WvgBzxXKb857xeFkIlrdoIzrE1rI/U+q4dM8gUYETlcJSMZXO05lYzNAG
         +oadbVsWdq3kjZICtpyi4K5Uz6G6QW8RYTZ/ICjscMvkOcIL1p8+wMIbqRxpw6fNUtjG
         DlFdoDV4YEOdc5ukVTi7aLYKe4cJ6HEtJnaFdM+ffJkEKQRI1NQJlRFjD8I6m8RMzBS0
         VD5jeOTfcd167L4Ht+74F6/L6BtqeJ7iitJmumNh+yTMXP5m66NAA305PNAmHr6rmjU1
         aEgw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id t18-20020ac5c972000000b004b7398f70f0si413018vkm.176.2024.01.09.10.01.34
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:01:34 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-2cXkj2t0MLWlF6UDPIEkjQ-1; Tue,
 09 Jan 2024 13:01:33 -0500
X-MC-Unique: 2cXkj2t0MLWlF6UDPIEkjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C28011C068D9
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 18:01:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id BC7AF40C6EBC; Tue,  9 Jan 2024 18:01:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3C3A40C6EB9;
	Tue,  9 Jan 2024 18:01:29 +0000 (UTC)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] afs: Don't use certain internal folio_*() functions
Date: Tue,  9 Jan 2024 18:01:13 +0000
Message-ID: <20240109180117.1669008-3-dhowells@redhat.com>
In-Reply-To: <20240109180117.1669008-1-dhowells@redhat.com>
References: <20240109180117.1669008-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

Filesystems should not be using folio->index not folio_index(folio) and
folio->mapping, not folio_mapping() or folio_file_mapping() in filesystem
code.

Change this automagically with:

perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/afs/*.c
perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/afs/*.c
perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/afs/*.c

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/afs/dir.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 5219182e52e1..35f7da6963fa 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -124,7 +124,7 @@ static void afs_dir_read_cleanup(struct afs_read *req)
 		if (xas_retry(&xas, folio))
 			continue;
 		BUG_ON(xa_is_value(folio));
-		ASSERTCMP(folio_file_mapping(folio), ==, mapping);
+		ASSERTCMP(folio->mapping, ==, mapping);
 
 		folio_put(folio);
 	}
@@ -202,12 +202,12 @@ static void afs_dir_dump(struct afs_vnode *dvnode, struct afs_read *req)
 		if (xas_retry(&xas, folio))
 			continue;
 
-		BUG_ON(folio_file_mapping(folio) != mapping);
+		BUG_ON(folio->mapping != mapping);
 
 		size = min_t(loff_t, folio_size(folio), req->actual_len - folio_pos(folio));
 		for (offset = 0; offset < size; offset += sizeof(*block)) {
 			block = kmap_local_folio(folio, offset);
-			pr_warn("[%02lx] %32phN\n", folio_index(folio) + offset, block);
+			pr_warn("[%02lx] %32phN\n", folio->index + offset, block);
 			kunmap_local(block);
 		}
 	}
@@ -233,7 +233,7 @@ static int afs_dir_check(struct afs_vnode *dvnode, struct afs_read *req)
 		if (xas_retry(&xas, folio))
 			continue;
 
-		BUG_ON(folio_file_mapping(folio) != mapping);
+		BUG_ON(folio->mapping != mapping);
 
 		if (!afs_dir_check_folio(dvnode, folio, req->actual_len)) {
 			afs_dir_dump(dvnode, req);
@@ -2014,7 +2014,7 @@ static bool afs_dir_release_folio(struct folio *folio, gfp_t gfp_flags)
 {
 	struct afs_vnode *dvnode = AFS_FS_I(folio_inode(folio));
 
-	_enter("{{%llx:%llu}[%lu]}", dvnode->fid.vid, dvnode->fid.vnode, folio_index(folio));
+	_enter("{{%llx:%llu}[%lu]}", dvnode->fid.vid, dvnode->fid.vnode, folio->index);
 
 	folio_detach_private(folio);
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

