Return-Path: <linux-cachefs+bncBDLIXLMFVAERBL5E32WQMGQENCXRLKY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2D1840457
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 12:55:28 +0100 (CET)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-783dc4137b0sf396632285a.0
        for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 03:55:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706529327; cv=pass;
        d=google.com; s=arc-20160816;
        b=R4NulZP0GusuSfosc8UQdMTSk3yu95F087u91PtRCv/iWgUv9/Bf6vb6yVcDgT7lFo
         dpP8w42HfstBkrtkimzT+dO1sWmKX+5uDdB0818/2/suYjnNNfVb0qQaXLyFPS99OgVK
         3vzgWCuMzu4zxvxo0Ag/5JhttMa/exOvWapk1GX6AFQwOXiZhEZwsrLrYSlUjAHaRQyY
         r3FjpSPfsYrbn7EcA7KOHeCRZW12R0+wc8bTW3jb77eBO4WneXpeq99Wd/1mrQBFyyvf
         oX6go4T8Q6rM0gNfnLFsCtmeg0+6MzQAtZ1SLsDf61jdcjc3wwUZIzsmOmBc63RMH8NU
         3A0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=tvSmutJDykrnVyWCPHTjmeMb5oMrneiTuAk0v3rALsc=;
        fh=vOUjozwhnszqhoZ4kGb20/T9SnkwXZbVZWre2xyclaU=;
        b=GF26sL3lGtSyKhElHEU0jq2DkIygtAMgt7hKp/nhrZHjQWSSgATb7SrP03Ki6MSQLb
         P7jZosSO/ifl8mAYiJcp8Hm4OO1psU8zuGZg/o4OvuMdEpG92VIThbGwAWqOy6fb5Blb
         3ozRkQ8qksF+L3ICNFa3O52HyLGCodGf7waBZ8VAJAPHcRf0esabnVcGamLWBBmf8qF2
         9uYnddnZlICqLWHl52Gk/SUNC2G0pNiAmqW3aICWZcOT3IVz4fGHU2WndsNnhuzJSKGW
         l6QJOvbJt2Nn45N2/4Zk1SXZlLLw5gnIPTPoYnFs7HfNknI7J9SUIbvfa0gKTbBA13UT
         ihfQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529327; x=1707134127;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvSmutJDykrnVyWCPHTjmeMb5oMrneiTuAk0v3rALsc=;
        b=WZmaZGdOH2QzMnc7ujBdAb6CaAr0drJVFl1egaLKoJC3EVJX+FpxULjouE9jdxB9pu
         eUnGoPSJXNAEdY/siA7KpUQSt9EDepnXsyFta8V7swHvrrxISZ3WiYk7q+LNQEFNSs5b
         P/z69zqKaZvKN1MW8TN1/xyyvFKfrl2/kgTYGsbC/83zGpZ5zFuLyD+ZVE58KPBVpQ2/
         HvXQC+/fH5mBnjquCJ/zbiox4jqmPeWCZmZF10r1vDnmtg5f3nAq0RRQcQHB1qW2mqI+
         6Osv95l0S6ocSa0B/HIe5Aaz/VYz1w4B5nd+phz4jy8xbhce/IpTxfUPTbTLqlH/mkxA
         2SBQ==
X-Gm-Message-State: AOJu0YztM6pMQbjI2XIjNC5foxWMFbhlmny6dRWq9nWWmCf/+NV2gSK1
	M4O0VT/0zzzEv8UAC2F1e+YzgbjZ0rg+fcpboYjte1ZTf8KFvMLAyfsGMp5apdM=
X-Google-Smtp-Source: AGHT+IGOFMRoGJxvZzQ4yQaS/5kUo6yKsrRfH74Pmddb71gLafyDfMW0F+5af7EOoExzGHAfZ+fCAg==
X-Received: by 2002:a05:622a:138d:b0:42a:a6ed:5b7b with SMTP id o13-20020a05622a138d00b0042aa6ed5b7bmr1666998qtk.12.1706529327359;
        Mon, 29 Jan 2024 03:55:27 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:315:b0:42a:b035:bcb1 with SMTP id
 q21-20020a05622a031500b0042ab035bcb1ls15790qtw.0.-pod-prod-03-us; Mon, 29 Jan
 2024 03:55:26 -0800 (PST)
X-Received: by 2002:ac8:5c45:0:b0:42a:3c93:51ef with SMTP id j5-20020ac85c45000000b0042a3c9351efmr5486043qtj.71.1706529326550;
        Mon, 29 Jan 2024 03:55:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706529326; cv=none;
        d=google.com; s=arc-20160816;
        b=EA1/vKrkSDg4A7XPp4pIxOHxqZM4Gh5X8go+HN2ufBrvLDQV7ZF6Lq58QoaCxVhl0k
         KUPmsKIre8kYB/o/OyzlECbJkuR0UnjxmJb28p3oND3J9P12RTncg/0mZk7MWVGfgz+d
         5H/uUXwi2ltS2xjaJciUWsuiVedH0cu9pmV9w3Oa+hMMKe3O15jxbi32NrIJGGpkfqw6
         eajD/0XuPb9E55f+IvSbse+nLxBDhCv/YcheKV15pRQwBXQUIyA7T9jusvYr6EOcK1RW
         n22ObgT7ATsB0nEco9YbTLYJRwSceugYcVATNtlgbuqSMF2a9QOKIIA1t6qRP3rZp4Jq
         tRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=l/klC/ghutWIOc1+EVzXLrxXcGHqt0/sieVr6S5RVKE=;
        fh=vOUjozwhnszqhoZ4kGb20/T9SnkwXZbVZWre2xyclaU=;
        b=u7m/4P81TUZcFwdTpA4l8IDjTdQo18vVyxGQ8nx9BU6loyjyw6seT1dWCVv9uw+AjX
         tastu1IbM9fyY2VatWVFt3SW20sEVQCZj8QSrb36MHnr2y0ttJn5S3Zb/oFWdbA94AaO
         ccIoui8nmNk5cksQNGpg2rjohZO/kWT9zI3QGENa/w4w7vW6sgHWzunXFlAKRZ84/5Lv
         eN06fuOxRL6sn2D/EaBbxMChdvXYmJFVQ5PTWnPEQ6yEnizERf8MEshPSmty2Ya5Hb5S
         K/Xtxi0ZpyLXkSGdGIaFnXLEVXcjXpFIMFICWrbIdwefWrG2PTin1OLqi+NP953ISPLZ
         jZkg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id n15-20020a05622a040f00b00425c3b740b8si7365705qtx.766.2024.01.29.03.55.26
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:55:26 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-ztHgt0IPMnyOBTJ7HGxiOQ-1; Mon,
 29 Jan 2024 06:55:24 -0500
X-MC-Unique: ztHgt0IPMnyOBTJ7HGxiOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3E4E3C100B2
	for <linux-cachefs@gapps.redhat.com>; Mon, 29 Jan 2024 11:55:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id B03DE2166B34; Mon, 29 Jan 2024 11:55:24 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 013882166B31;
	Mon, 29 Jan 2024 11:55:22 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Latchesar Ionkov <lucho@ionkov.net>
Cc: David Howells <dhowells@redhat.com>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Christian Brauner <christian@brauner.io>,
	netfs@lists.linux.dev,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [RFC PATCH 3/3] 9p: Always update remote_i_size in stat2inode
Date: Mon, 29 Jan 2024 11:54:37 +0000
Message-ID: <20240129115512.1281624-4-dhowells@redhat.com>
In-Reply-To: <20240129115512.1281624-1-dhowells@redhat.com>
References: <20240129115512.1281624-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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

