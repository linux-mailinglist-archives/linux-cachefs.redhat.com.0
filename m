Return-Path: <linux-cachefs+bncBDLIXLMFVAERB6PM2WWAMGQEA6JMB6A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95A823003
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 16:00:10 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-427e291776asf9052701cf.0
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 07:00:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704294009; cv=pass;
        d=google.com; s=arc-20160816;
        b=reTzkNpHPS90BtW/z8PuWKUTtu5RFGNv3AzqNy46RsDjwhQULE/cOHjOMn+o/pNKrh
         jOPMzrXiwKFKnMSBQ7vK17eI2gnl4z5WNSdpb79ktF4bjERAtZhBE1bCGb4XuvB8soen
         IBm3EMhEu13yt2uVSsGhTgVgbjRXIQmsyW4/aRILa/nP95yLwwUExFVBPknzlEYN6YCF
         uFgqmVbV+KKJpES9tzhO4iPYYtNNSVL8fv1z/KAZRyBE5Di6eebvGNPNtcYKmbmxeLbC
         QpQlKfIrtsMiZajkETkQ9lG8vI8QYnnBUa6xN6dx3VTKE4AbErkJlRY9PbUsgt2voyfo
         Njxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=tvSmutJDykrnVyWCPHTjmeMb5oMrneiTuAk0v3rALsc=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=czgKt91B/QG+cGXZlZOm0Jjc/rF60JYIJS1mnWxmnGywyEVPlWigKo0SMDspGRIrfh
         ibkAIyS52vUv46zPKKNgE/4+ZTFRxsMYY818r4Uhlt3+bQoeYJQRwGY3cVQGp/TlM/Uy
         1hbwmTd9okiag33CnUSuVoQGABGRqKxb1t4okkOaCpTYFtHlRKg/ICGoejf1eQhorvoY
         FjromNzzH1mzfL+0xLBQ1DdZmgF/iDfQCuElurs58QnfrpmH5H/0FxahRmxUK0Qvl2Cc
         mPPv+IN2i+l0kojdme4Wtc6tfcH/VXOp9Gvhj9G5uVaEGzsKUH4Hlbg57YSNRYCoW+uq
         mvuA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294009; x=1704898809;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvSmutJDykrnVyWCPHTjmeMb5oMrneiTuAk0v3rALsc=;
        b=YDb8mrj3LNumo/wKaRAa587+S00bIXS39tsTknSLb3KJIxtbygcrgU7GhSy+tAA5kA
         L8Uvz1ID2HoBqAgDRhnwhz5p68g14IWW4Sx7DPTVCFJg2hzGyvstU6p5VlK7HPA/Dx+j
         3KtolzQg/i8vi2KPiNqhTuyOb6N+gsn7IkIMhSXIb2RHGyi2XL+5kj+Ku0EHlPD5jrmn
         anUmt7kYq3XzEySnaGYKuaQTnFZjy52iqNArc194GjCwnVrIELIOzFznVNZQ6b/LcAi0
         uR+HnZ7g/4T8cLeBpnJgi83Nd5b384EJPZpnHJ2IN2rkqx6zBU20OWhpHzkujXXkc2OH
         0dOQ==
X-Gm-Message-State: AOJu0YzZQMgcxJEn9dt1F3xcAuedkOdjK7BpQk7ABNCsOAyHPVwXJmDG
	9luxe4Xq8RtF2qjY+pP04tUj/dvansZxHg==
X-Google-Smtp-Source: AGHT+IGfUHIWEk9X/f8H9Hrux+CBbwxZIfBuWNOwgdg20pepWS/xJkfM+hRf1VKD5bMN/CXUkEEang==
X-Received: by 2002:a05:622a:2a88:b0:428:3789:6247 with SMTP id kf8-20020a05622a2a8800b0042837896247mr1171867qtb.5.1704294009353;
        Wed, 03 Jan 2024 07:00:09 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa3:b0:427:e936:779e with SMTP id
 s35-20020a05622a1aa300b00427e936779els806126qtc.2.-pod-prod-00-us; Wed, 03
 Jan 2024 07:00:08 -0800 (PST)
X-Received: by 2002:a05:620a:1a9a:b0:781:1c15:6992 with SMTP id bl26-20020a05620a1a9a00b007811c156992mr1739287qkb.26.1704294008095;
        Wed, 03 Jan 2024 07:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704294008; cv=none;
        d=google.com; s=arc-20160816;
        b=RnA5/tVXkS+FUnlAVcTdwRJFzW68sEh826yL1CwmueS85khIbBlQbPxifR4hShnTd2
         LBl5QWak5Z5VbfCpXPiHvqLUdCxQtvcS5vaxwi0tIL+PDFz9VbDdSubl5zurdsDguWSc
         Xeyd5zxjJnVqZ/sQqXVon7V+rmLVnl8jfVWtqP7XZ5nCkbIVDjO70rghpjnH2NZQCmYx
         BZBrTCsMXLJE1KkngIbitgWp3hDshj7UZFIdJqynZJAmlFOlwhC64zQPUSDOja24wPrM
         fTz7/bP2xggRdOyeBh3UtH4/wvzCGjLgNYrP9V2KmZwGMOvw4MRf396fwwIDYfeiyqID
         Nf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=l/klC/ghutWIOc1+EVzXLrxXcGHqt0/sieVr6S5RVKE=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=Wsq1wCfvisVsq2lMgTlAM7V4j9lDwIIAm11oO0XUKd3lhEZWQvg2S/pANkLDKrYD09
         7F4OhC+ujRs93VS5ypGqiVfjWK3f3NbiG7Bdbq9JYw/HJcvCVwPnDw8WtkSqSZeskAmD
         4TmtkL97P5cY00ZPtw6TblUP/H6mRIwbxJ/qxawtheveKoKbvIDSaZ0c9JopvuXuO3tv
         5UmdRw9Lvit8Zt0ejHas3kCHHJCwV9gwcwFOgBPAd+wUQHFmUFrzgacX2R1IU6joHq8I
         GOWV8NbvYV2nFqSwXM/9NsWQPrYJJnb/J/d6jc8Igl/r/UuOa2V0Wy27+iP04mC0eEC/
         qCoA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id d6-20020ac85ac6000000b004283d581a5asi168235qtd.628.2024.01.03.07.00.07
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:00:08 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-y6ZxRInjNZ2P8_wDKyqqnw-1; Wed, 03 Jan 2024 10:00:06 -0500
X-MC-Unique: y6ZxRInjNZ2P8_wDKyqqnw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 558FD83B826
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 15:00:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4F9FC2026F95; Wed,  3 Jan 2024 15:00:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DFEE2026D66;
	Wed,  3 Jan 2024 15:00:03 +0000 (UTC)
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
Subject: [PATCH 4/5] 9p: Always update remote_i_size in stat2inode
Date: Wed,  3 Jan 2024 14:59:28 +0000
Message-ID: <20240103145935.384404-5-dhowells@redhat.com>
In-Reply-To: <20240103145935.384404-1-dhowells@redhat.com>
References: <20240103145935.384404-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

Always update remote_i_size in v9fs_stat2inode*() if the size is available,
even if we are asked not to update i_isize

Suggested-by: Dominique Martinet <asmadeus@codewreck.org>
Link: https://lore.kernel.org/r/ZZVctju5TEjS218p@codewreck.org/
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Van Hensbergen <ericvh@kernel.org>
cc: Latchesar Ionkov <lucho@ionkov.net>
cc: Christian Schoenebeck <linux_oss@crudebyte.com>
cc: v9fs@lists.linux.dev
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
---
 fs/9p/vfs_inode_dotl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 3505227e1704..aa3a77bb5e86 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -684,10 +684,10 @@ v9fs_stat2inode_dotl(struct p9_stat_dotl *stat, struct inode *inode,
 			mode |= inode->i_mode & ~S_IALLUGO;
 			inode->i_mode = mode;
 		}
-		if (!(flags & V9FS_STAT2INODE_KEEP_ISIZE) &&
-		    stat->st_result_mask & P9_STATS_SIZE) {
+		if (stat->st_result_mask & P9_STATS_SIZE) {
 			v9inode->netfs.remote_i_size = stat->st_size;
-			v9fs_i_size_write(inode, stat->st_size);
+			if (!(flags & V9FS_STAT2INODE_KEEP_ISIZE))
+				v9fs_i_size_write(inode, stat->st_size);
 		}
 		if (stat->st_result_mask & P9_STATS_BLOCKS)
 			inode->i_blocks = stat->st_blocks;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

