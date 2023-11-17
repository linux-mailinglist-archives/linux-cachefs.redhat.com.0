Return-Path: <linux-cachefs+bncBDLIXLMFVAERBENR36VAMGQE4ZSWQCA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAD97EF9C3
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:10 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41ea8e21785sf62301071cf.1
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255889; cv=pass;
        d=google.com; s=arc-20160816;
        b=LnCtkI5VWyBpRWS10eCISz8dLH1Lvik3jyu2gtq0mNqye3lUPl3Ha8GbfNK2MlvYGJ
         Lp2tTUTav4/onweU4bKRWe34oT+1VRdg2WkF4/+WT058PgaRmMsXllIHDzg3u0cdv3gU
         yr6rNHZtqeNNfYkY9SjXdjhsMBPdYKNy/ZLil25XNiyQsge9AeoDwCZZSTyev3p6AdeZ
         Z+akXO9M+0KeG70ZOD2E2K6sGL2jMa6Tm9qp41BwylayumLXKdba5TejmzT0FQUuazxo
         X5jOu+9xY8zH08te6BhgqzcM7G6CytlVIbY3jotpJlTN7ttDq29DWmBV5Qb5l4XYVFTS
         JYQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=wtl/BObBIRQIv66hgNCsE4lVweao3zhOn6k0VcTShJs=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=KSe87essBVQTmswHJ+GdJJvsEXhMibwWWrbA6TdloVMoTHCahmFnu7JWQr9v9jnunK
         3gb4+L1ijhptWe7fJ80eYZxKF5ki55xLOishzMPCiQ/TUceRF/XCh/Bppy+6KKIKpuJC
         y9bYRhvEb/VDcPiVjzimk0yIeUgy4XBE6ENspgSl2FdHSDkoSlGofA/gO6dadVJWG2/S
         b8yXDemq3EgN6Jp8aXyg8b7nuPM6HFZ9RQGgvwccmD7kPM8YwDn3MZC0Ek1YgVBBS2wv
         vl2VcjQIsqqQEel05KHYSljtOvGzEygTP0FJvUm20OiHqozobZlBUQ9xkSHF8GgcDoY6
         fEzw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255889; x=1700860689;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtl/BObBIRQIv66hgNCsE4lVweao3zhOn6k0VcTShJs=;
        b=hhYWkMh6L9eOwM0+21fm4B5Q5o/iddoawa64vfI5TOQlUit79wxwi9Sbmsbe93oFSY
         XRco6dgCIo62b/qst6IwfuhQ6Ublv0yWnoOjP63Dm6WkRFwqtVACzUNVA0TLmxmidvs6
         EJAon+97dOQWhMHZojHzNQepEbQRICQAr5XcQ+UFRtUYhq1+8LBrLT1b3U+JvTyHEser
         jyuU3DL/XeihnxW80qV5eyF0/pU6vgcwpOzrM8feb/9iw1zjQ+DJa36he9npjhY/auEI
         iKlN990/LlN0qWBscqc/71HY/NGMU163BSGsuGriVpbMbhgJ7Q1sEDmjxKQWPDQZfOEF
         gDrA==
X-Gm-Message-State: AOJu0YzyDQguXv/pZN5w+GdUI3ZTm2xW2Pygf0kq3NoHBSmLhWPrS1uH
	Zh9dD8t+EH/stYrOcGuXlHGvRQ==
X-Google-Smtp-Source: AGHT+IE+vcfxhumcKQ+AF8h1za6JuxUhGLCluKpjLjl3mfq4DzeZ60oN3slLSoII3A8cvKicAHdhDg==
X-Received: by 2002:a05:622a:1004:b0:41c:c045:2c86 with SMTP id d4-20020a05622a100400b0041cc0452c86mr8954626qte.31.1700255889526;
        Fri, 17 Nov 2023 13:18:09 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:7d13:0:b0:41f:f013:e433 with SMTP id g19-20020ac87d13000000b0041ff013e433ls1416489qtb.0.-pod-prod-00-us;
 Fri, 17 Nov 2023 13:18:09 -0800 (PST)
X-Received: by 2002:a05:622a:60d:b0:412:1c5f:478b with SMTP id z13-20020a05622a060d00b004121c5f478bmr655384qta.15.1700255888941;
        Fri, 17 Nov 2023 13:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255888; cv=none;
        d=google.com; s=arc-20160816;
        b=wp4XRrwMQyODKEpw4qfY8TYcy906Gtsx3bbHpgFytWM53FfpXnj6liBr/y5f/BatcM
         2+3OQtTTxa0eoays8yIazXtQZd6Ao7fiiawQDOUkHrC8BKF062riT4JfBhAItPCeejH7
         gmNZSFkxVuloiWSfRWv1Y6UVcfHWT67ducn/dz3RSg+cD5ZGn/q22G8UO/ulovOBtYjZ
         1qhd6oA/bYogq8XLR76YOgTjqGvczc81HpAQYwfn5bBQ/HgOEf1dUIJDUEwPdhOJYhR8
         Udeya9fsuce0Ma88I+sLPFJtEFCRVwwXOMWfDWbBA6zmwyxdETd4woRSh5D5grB8sfSN
         EIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=5Qasw+3DRr0CW1YV8TSL9wIAaCWlUGU8d7+6bcjpE3Y=;
        fh=lVY/c7gYUTDnyYYKKvGQU3Q29dA69hck6eN/HP5dBQ0=;
        b=bdSPwZnHrALWYWMZ3wig8u7NZNBnVMT2Hi9Y8OpWL2CyMiUcYHssU+htXvjWFGK+eA
         vdQhRu3u+gOIks0EUniswqO1CnecgRVdLzES/yCRYjtpO+4wHPolSqv4Usdcp++jLuFx
         iItkaUjCOlpd8UnOxvNwVllpUJ5ufmu0SR7wpWOobEi+BSuIStaNtmPMLJIXJNcvS1gQ
         rQMPldbuArpV1x9lUv0hshJKbM65J1VqBZMnpvXFl6z2kpFNQjjV7s2Ce5VW4guhbM99
         gPw6q+2ae0GCCHLoXDey1e6c8W/MnwjjDfAa7AuMLcBBauO6ftBVatzuBnTjiO5Z9IvI
         JLRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id s8-20020a05622a178800b00421ba5e92d8si2382568qtk.620.2023.11.17.13.18.08
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:08 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-IjUR4PTBNCCIxMFX_OmPow-1; Fri,
 17 Nov 2023 16:18:07 -0500
X-MC-Unique: IjUR4PTBNCCIxMFX_OmPow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C34B31C068E4
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id BFEBB1121307; Fri, 17 Nov 2023 21:18:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 29E541121306;
	Fri, 17 Nov 2023 21:18:04 +0000 (UTC)
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
Subject: [PATCH v2 35/51] netfs: Support decryption on ubuffered/DIO read
Date: Fri, 17 Nov 2023 21:15:27 +0000
Message-ID: <20231117211544.1740466-36-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

Support unbuffered and direct I/O reads from an encrypted file.  This may
require making a larger read than is required into a bounce buffer and
copying out the required bits.  We don't decrypt in-place in the user
buffer lest userspace interfere and muck up the decryption.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/direct_read.c | 10 ++++++++++
 fs/netfs/internal.h    | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/fs/netfs/direct_read.c b/fs/netfs/direct_read.c
index 52ad8fa66dd5..158719b56900 100644
--- a/fs/netfs/direct_read.c
+++ b/fs/netfs/direct_read.c
@@ -181,6 +181,16 @@ static ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_
 		iov_iter_advance(iter, orig_count);
 	}
 
+	/* If we're going to do decryption or decompression, we're going to
+	 * need a bounce buffer - and if the data is misaligned for the crypto
+	 * algorithm, we decrypt in place and then copy.
+	 */
+	if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &rreq->flags)) {
+		if (!netfs_is_crypto_aligned(rreq, iter))
+			__set_bit(NETFS_RREQ_CRYPT_IN_PLACE, &rreq->flags);
+		__set_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags);
+	}
+
 	/* If we're going to use a bounce buffer, we need to set it up.  We
 	 * will then need to pad the request out to the minimum block size.
 	 */
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index fbecfd9b3174..447a67301329 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -193,6 +193,23 @@ static inline void netfs_put_group_many(struct netfs_group *netfs_group, int nr)
 		netfs_group->free(netfs_group);
 }
 
+/*
+ * Check to see if a buffer aligns with the crypto unit block size.  If it
+ * doesn't the crypto layer is going to copy all the data - in which case
+ * relying on the crypto op for a free copy is pointless.
+ */
+static inline bool netfs_is_crypto_aligned(struct netfs_io_request *rreq,
+					   struct iov_iter *iter)
+{
+	struct netfs_inode *ctx = netfs_inode(rreq->inode);
+	unsigned long align, mask = (1UL << ctx->min_bshift) - 1;
+
+	if (!ctx->min_bshift)
+		return true;
+	align = iov_iter_alignment(iter);
+	return (align & mask) == 0;
+}
+
 /*****************************************************************************/
 /*
  * debug tracing

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

