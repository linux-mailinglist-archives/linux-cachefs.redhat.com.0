Return-Path: <linux-cachefs+bncBDLIXLMFVAERBF6Y6SWAMGQEQIGVYSY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mail.lfdr.de (Postfix) with ESMTPS id C71BC8284B1
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:20:56 +0100 (CET)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3bbf9330908sf3896423b6e.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:20:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704799255; cv=pass;
        d=google.com; s=arc-20160816;
        b=sg2X5Pc4Ua9wIEe/RCaAwWKVkYd8NvPd+hFcKQhFrzHPQ9bIM/6iIyPhXTiKpknyLN
         YEKRYPvWt399H7J7LPtwOfLqH+7DKyoJwTxMjZB5787JlH/muoJ5DmpieT0T7XEjBn1V
         GcdPv0dVepV6ZOJ7GhifnZ5/BpRWHUK79pjRgLFHSVL6f9Bo8BPXt3BabXi32cwcxnFv
         po4m1I0LHTaNHCqQ8zQeQcBWuDfjm+7fBf9NzhfmIMhbAbtSpXfp9304WmyrBtaU3UHk
         pAS7BvqSHOC4+ElyVnk8V8pZvgZ3TZHEJCw2dXgdgOZqqrYH803zQC5bS0Z5F6FvuTZR
         3odA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=O6H22MUkIbQSB/5NcY4LT3HsmVYVGCZ5q9uYbOZCl58=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=0av6jy3kekBBE8ekSgR3DPNpmVBs4eybz8j23+lafMSKZmd4Wx6Y/OprL9Th8rmaA/
         AQu84VzP9QJN56eCT6O1dVKn8St0KvsuXJJ4WK51H+0Xk5t7QD9TJdoTkJ++bxeWMSk1
         J76lDvtQuJKj4/tGGxyHcYBYG1o64er9TCbKC3/ssb+L2/hdhLdCFhKUryjhz4W1T2XP
         8T1reQs540Vm+DVReJFnQIhZPkCpgirldvGficOYJYJ/Y7SzOUXOQhY1XnZilWBoftDB
         IZ99Ho1Ia0UnkKPREO7UcONOW0x2PPcClJkrcfxX2efRFjomqKCdUtUt0u8pU0PeuWDH
         8Cyg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799255; x=1705404055;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6H22MUkIbQSB/5NcY4LT3HsmVYVGCZ5q9uYbOZCl58=;
        b=YLqtXW5hOQRg9nmyzTc6N8ndBMj7Xp87e3sWZuacuD3ABPRorK1QJCO0KLBMtM9AcQ
         f0OKWm7x52CVsguhKHUpjQZnNY/bzxqxmAI7rmwyBqbDWRDdXkj5i7aoPvjQ1nw+4Iat
         LSkbcJ/0GYCJs9csIBjk+1aI/Rrd0sHGTvHE4DshMvibOx64y/OJ+ufkaoT0t5LuHGej
         otxONrXMuU2oaI25ZO+lz8eHiSqYggc5GfbCdBi7sRb2I3gnyomzD+IMzUzZCgbmcFm7
         LsWRKVyWG7G+vNDP1B6vs5BmT/QR1TLquKsLXBYrigdI/J+JuImc2acbv4JzyenezVZT
         152A==
X-Gm-Message-State: AOJu0YzZ8bvCTR334k+kKBzRfXiZH+wiaiPCgFgEk6HCWFpqSWAYmI35
	UVExQ9FCvPoOHK9b5K3TT6Kdldcu3fejww==
X-Google-Smtp-Source: AGHT+IFeexcc8S6laUkB9QGxObkPts0oTCp+IUeJI4RRthvvN+B70jKKnuUSAS+5rqGjOt5dDq1nAw==
X-Received: by 2002:a05:6808:6486:b0:3bd:330a:3ed3 with SMTP id fh6-20020a056808648600b003bd330a3ed3mr2477866oib.114.1704799255636;
        Tue, 09 Jan 2024 03:20:55 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:926:b0:681:10d0:e200 with SMTP id
 dk6-20020a056214092600b0068110d0e200ls976139qvb.2.-pod-prod-08-us; Tue, 09
 Jan 2024 03:20:55 -0800 (PST)
X-Received: by 2002:a05:6214:19cd:b0:67f:4d05:bd5 with SMTP id j13-20020a05621419cd00b0067f4d050bd5mr4215786qvc.58.1704799255010;
        Tue, 09 Jan 2024 03:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704799254; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtEbSDdh1i9qUL0w072cNlPX/q9wAh9JmBQuy7EldwsLLgkVHhj/7wccfH+LIo7JET
         os0v+Iql85OGz02hKzomklESVAMLiC6qqOUESn3JJ4LPJhb/CfHv6RmpDj49/B7ZacEW
         zk4pBIl1rE8Y0R1aWuek1+JACsu+EPUmfRH1p3OQimut7uEAspWs+4DFJ1NcPR/Js3oD
         qxmjB2pGyeNe2xBCOSVfOi6DbVY6lqMs+F6Ypc3y6im6R48kgzZfv4ZLvTzlpSuhJ0ZR
         U2XOWQT0aR5+FqYGdECKtVeiwIgpEmq1l760EF0n+VMqfpWaRuv8v088bgrwKh2zHyfV
         BqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=v9Zmt8qPNtA4BbCqgJuw0LKGT28DtGNcpxFrcZYWG/0=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=JjoRvwqaku7in7L1l7sZpBg1qLMS5mHMwM6hxgP0FJ3Mcg6Jx4ibrtYlCcumLI0ytK
         zTwSvj5pHNaiBvi7UO31qk/iy4DexdT3p5L35N6zo0xWYdae8EyCY41ke7lzXxSkrsTk
         mZEHxJhtA1HrKIl4U/t/eibrdGWHUX7ZdqNogXRoXnMwQDVLzdeuxILEA4IMdeXOmFdV
         mbbf0230SETZteVDwhq3P03mMczQyWm338G+B7ulpBQK3P/tn1pt+jjWUulykWnTnjVw
         tGuMUnV/iULV/Acxv32C7wLUVjOozLB5u2Ul+pfzv2aOY6bCMHWm5OQP/COWpZlRs941
         GmEw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c14-20020a0ca9ce000000b0067f2ef1a8a9si2047559qvb.296.2024.01.09.03.20.54
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:20:54 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-VG0i2ZJvPE6V4w8rfmoQLA-1; Tue,
 09 Jan 2024 06:20:53 -0500
X-MC-Unique: VG0i2ZJvPE6V4w8rfmoQLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F1113C0008C
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:20:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2B5132166B36; Tue,  9 Jan 2024 11:20:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CD382166B32;
	Tue,  9 Jan 2024 11:20:50 +0000 (UTC)
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
Subject: [PATCH 4/6] netfs: Fix the loop that unmarks folios after writing to the cache
Date: Tue,  9 Jan 2024 11:20:21 +0000
Message-ID: <20240109112029.1572463-5-dhowells@redhat.com>
In-Reply-To: <20240109112029.1572463-1-dhowells@redhat.com>
References: <20240109112029.1572463-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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

In the loop in netfs_rreq_unmark_after_write() that removes the PG_fscache
from folios after they've been written to the cache, as soon as we remove
the mark from a multipage folio, it can get split - and then we might see a
fragment of folio again.

Guard against this by advancing the 'unlocked' tracker to the index of the
last page in the folio to avoid a double removal of the PG_fscache mark.

Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Matthew Wilcox <willy@infradead.org>
cc: linux-afs@lists.infradead.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 1 +
 fs/netfs/io.c             | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 6cd8f7422e9a..0b2b7a60dabc 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -698,6 +698,7 @@ static void netfs_pages_written_back(struct netfs_io_request *wreq)
 	end_wb:
 		if (folio_test_fscache(folio))
 			folio_end_fscache(folio);
+		xas_advance(&xas, folio_next_index(folio) - 1);
 		folio_end_writeback(folio);
 	}
 
diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 5b5af96cd4b9..4309edf33862 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -126,7 +126,7 @@ static void netfs_rreq_unmark_after_write(struct netfs_io_request *rreq,
 			 */
 			if (have_unlocked && folio_index(folio) <= unlocked)
 				continue;
-			unlocked = folio_index(folio);
+			unlocked = folio_next_index(folio) - 1;
 			trace_netfs_folio(folio, netfs_folio_trace_end_copy);
 			folio_end_fscache(folio);
 			have_unlocked = true;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

