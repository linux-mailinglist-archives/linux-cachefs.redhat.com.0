Return-Path: <linux-cachefs+bncBDLIXLMFVAERB77M2WWAMGQEU2JXHPQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450C823005
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 16:00:17 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-20553118ac5sf3500598fac.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 07:00:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704294016; cv=pass;
        d=google.com; s=arc-20160816;
        b=bVh0U9vi5WCPeZGILS5uI5p/bW8pd9tcv7P5AysycHSBvwuhH3X8m4/kDuxgvpsf7U
         M5Oaz2U4T4qA/xrfPghYlthSVJuKTQn4IoID3qhenRPc0s9XQu9gLop1EYs/UZDsS60Q
         1+XX+qPB39qO2yI1BBxtfy1yOqMSIBl6r1upoynVJDRaHYnNuL9nYf6gq2mwylC4lnaX
         q6ylxZar6mb64KtCT4p6+5WKI217HlERAxnA/zhpLni0pmxTpdugIBjo86GrLGCfO4sW
         5rV0qfOAT0ALT/Vnz1MimLvrpLPei15HQrc+82rdr97Q7lEnDAyPKET3Sy2Q+3X45SCv
         /+aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kI/IrLm17e3V4yaZzgvW1kdbrf25C0jQAKVrwyj7uDk=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=qOJoi+cY/fuZT6kmgtqXmIuQY6FFziJHnkGHi7ugXSyCqVH3T4sxM0ugtLvVlinu+t
         YqNWxec2RlnRFp4x4MUS6Cp8AMGlsiEOlWsnv/Wh6rfLm1e4gkwhhA6cFxU49fbJWKBB
         nR8FUPonqGXUnXCAdA1RAljTx9jhDkLFQ7opHF44X4P+5TDs+XMJcTH5yIrZMkzL9xR2
         sI4aOfO+ZxaFXz5z4eRNun8YPFTjsDzmQL2y1/MRUSjtkhtl1Z9Dys7Y8zVKYEhZ4BXB
         71cKB9M3d8dqhDOtEI6GyHSJNxEVEQk4BgW5B7Ath3cSWb1c1Cvey2RfShuwbHZdwCT/
         cEYA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294016; x=1704898816;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kI/IrLm17e3V4yaZzgvW1kdbrf25C0jQAKVrwyj7uDk=;
        b=QRskF8MySrDmWEpJ5IeNGGhpsEwACaJMjDlvTPLbpC3H+uNqvRoT3Xqq3YKmM7BVVr
         TZrVMVUEdrfT2j3KQMyy2ql7GW/Gs5gat3fSF75E2qupqQu/od7+39sEOc3njOtoFul5
         Wb8Wh955yVukLsoCMk60E/mI8zk5eOjvf/OtmntLWO8eXBndTE7r8B+9Xtp10hVPGutK
         jx5BMfQDrYRTivFX5kDu2k7yNSYh+0EU8dX4ivRvsbVhfsaTss9ZuErOUiPKNu19pJqk
         s+BlZk8KOWsOaEPJM8NSX7OvQgUrw44f3GfJ3UrQoELBrL+aSv/C6suk/xJtTEen2M4R
         OGKg==
X-Gm-Message-State: AOJu0YwS6uAvAP5/yBcm0iFUH+LuvKxgcVSQZxDlqp5+YKhWVAUMHu0C
	aQzPNd3KV9ja8KCu+leY0MwSU6lbSNuymQ==
X-Google-Smtp-Source: AGHT+IG0kzDO9GR9maTT3/y3pDBa0cGPF8QSH3v3AybhFfG8CYV8uvB+CauFJUJ4laGXckzzcyYz6w==
X-Received: by 2002:a05:6871:28f:b0:203:c074:6cc8 with SMTP id i15-20020a056871028f00b00203c0746cc8mr19642173oae.115.1704294016054;
        Wed, 03 Jan 2024 07:00:16 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:4988:b0:203:c880:47a1 with SMTP id
 ho8-20020a056870498800b00203c88047a1ls384300oab.1.-pod-prod-08-us; Wed, 03
 Jan 2024 07:00:15 -0800 (PST)
X-Received: by 2002:a05:6808:3c90:b0:3bb:c393:662c with SMTP id gs16-20020a0568083c9000b003bbc393662cmr17099516oib.15.1704294015469;
        Wed, 03 Jan 2024 07:00:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704294015; cv=none;
        d=google.com; s=arc-20160816;
        b=cBYHCZCUbzFdx6zWiO8BeCgoSDydkyqgZ0cwT+DMPcFdCfaV+nTBdbsKoK7SmmISKN
         ueu9ZSF7ylDLbvEuqoZoveq5TEogMQVu9o3XgsGzF/JQs+j6NDCYShsMyaRC/EABhdDP
         HrrZgestrZdSW4vPKo546xE8GlfJqg4BQlj+ehoc2E4ga7bYFFSu8QAPSPnSnRkCeQXT
         qPzlYrSVviVm8wLmVpc1mGDIYIoVk/OChr+mPuMmYr7VzYI3Kvx31z8b//OeiKW8Pz79
         dDXl6DqlDtWCAjX0Qo4Ry6a/mnWbd5g2yJ+1ka+2bH2yz7ST5aYzqtGit2y3KuMwngF0
         hOJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7QMJZ+3lHeykV3WPSbajID2T4bzMyvXitF+gI+XPTjU=;
        fh=z2lFNIQm1BYTiGQWz0rp4lP3BVSA1n5g+uZ/88gyKRg=;
        b=0QBzZqBUEhQ2MsQIlGqHl81/CAzVB2sbUOnJ+bkYbNoSX+dRTtdNjb1Y3MaFszciKb
         8hujMoYz4ZiEiqsGIiEsrck7V2qO2LZCDCNw/FWPcWBITc6RgsqyKrMLLG+ISHUrMedh
         S0VLRSPAOOr5TXVlr039e5YTKeFnOG815JA5IT8mf0grJvXAMO1LgdRkVSck5/Z2Unkc
         UXTwJl/OXcPhiZnag6b/sGinO2pwVYN8+t2LjzIoF38oS5K7Q9cKFyerHailyzcSZ7Mz
         PW2QUwOpzkJanoD6sm9gws4Q3g8C7MzxYiBuBIbXsvgZ2chXpm3686pankPqyTIynht9
         js5g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id w2-20020a0ce102000000b0067f89f0a735si28567544qvk.236.2024.01.03.07.00.15
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 07:00:15 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-WLTkkAv-PmSE1_9JqSrCQA-1; Wed, 03 Jan 2024 10:00:11 -0500
X-MC-Unique: WLTkkAv-PmSE1_9JqSrCQA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F4F4881B70
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 15:00:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4C5DF1121313; Wed,  3 Jan 2024 15:00:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A2D21121306;
	Wed,  3 Jan 2024 15:00:06 +0000 (UTC)
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
Subject: [PATCH 5/5] 9p: Use length of data written to the server in preference to error
Date: Wed,  3 Jan 2024 14:59:29 +0000
Message-ID: <20240103145935.384404-6-dhowells@redhat.com>
In-Reply-To: <20240103145935.384404-1-dhowells@redhat.com>
References: <20240103145935.384404-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

In v9fs_upload_to_server(), we pass the error to netfslib to terminate the
subreq rather than the amount of data written - even if we did actually
write something.

Further, we assume that the write is always entirely done if successful -
but it might have been partially complete - as returned by
p9_client_write(), but we ignore that.

Fix this by indicating the amount written by preference and only returning
the error if we didn't write anything.

(We might want to return both in future if both are available as this
might be useful as to whether we retry or not.)

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
 fs/9p/vfs_addr.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index f7f83eec3bcc..047855033d32 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -29,12 +29,11 @@
 static void v9fs_upload_to_server(struct netfs_io_subrequest *subreq)
 {
 	struct p9_fid *fid = subreq->rreq->netfs_priv;
-	int err;
+	int err, len;
 
 	trace_netfs_sreq(subreq, netfs_sreq_trace_submit);
-	p9_client_write(fid, subreq->start, &subreq->io_iter, &err);
-	netfs_write_subrequest_terminated(subreq, err < 0 ? err : subreq->len,
-					  false);
+	len = p9_client_write(fid, subreq->start, &subreq->io_iter, &err);
+	netfs_write_subrequest_terminated(subreq, len ?: err, false);
 }
 
 static void v9fs_upload_to_server_worker(struct work_struct *work)

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

