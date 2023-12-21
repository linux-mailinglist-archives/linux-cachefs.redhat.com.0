Return-Path: <linux-cachefs+bncBDLIXLMFVAERBXXZSCWAMGQEMQCGHYQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C03581B772
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:25:52 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67f623d7599sf8050756d6.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:25:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165151; cv=pass;
        d=google.com; s=arc-20160816;
        b=eChE52LF7uwhMi35OFKKtPtRye9DlwQrkQqzf7M7RHBZUeRyf8f1a0HpsYAQoURPDv
         D8eAoGL2GPijQHy+inVeOcmreEYLrw5tO3XtaQxJb8Jea9BQSeVMSXR8Bxi+TFTnApyr
         1LSxdzFXtVjtjMZ+hoVT0T0X+HyTsVGh1E6KbFKTqglNLSAw3/sr9qsJfoAa0aEzS9rY
         xYNdh8IJYH5MnpA/VK774cwTS7fQkPpRYwekiKtxNvw5BGvCg6CAzvnmHUBxIlkvwYr2
         rHKXv/i7m/m+c86e739CDWBQQ+kHRkXpjbU26ZmXq9CeWEEu2n4pr3f3nDECPZoH3e9c
         oZdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=3JY5oAoEVJ17ChkHsCnwDSrC1YivVprQvHv88EW+r8U=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=XNOh6PY8DbONK2sFhSvoPUiYI3mURbKbNhvCOdz77iSqqGOpp6EePOOP8qzYxRLfdM
         4ADnUC/G/jWCDUlEEhVnmCt5/RBbyo/j6MGRsT4QjptqYw/+EP/pdHGZrxByL0+nzK/p
         SN4E6OqLSzb4bZ4jA3tB/ACy50TUtTqDRDtPqB2qMtTznKv2tx5vT0/ngRBbAivZlms/
         WYGscUdCoVQdcqMwKzJGXQncaZDQEAgwQsth84IlcRwkUK4yALqphRaVe2ZEbQ5ZgoaC
         as+JVioQgT3bBgJ6h2rSHnM7Eszf7LBhaUc5yslDV9xzJSaMPYFzil4gMFdz6YU5V9e9
         AZHA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165151; x=1703769951;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JY5oAoEVJ17ChkHsCnwDSrC1YivVprQvHv88EW+r8U=;
        b=KtX5+jPDO8n9D5n+26tpzaxi9QdUDoKWY6M7yyQR8P7ApWlBlIuKRNbUHS6k8CnCEF
         6Sm/zHwUCBu61YeIH6Cu38W2oDbpF0pY/0LPP5d0f95CYRF+V8MdlA5TpMRiuuyAfsXt
         zTtUyaPKQ8B26hTh7E/IXA+qvLJpoFhsNInUoLAWc/iSjnHw/wjySDrv1V4MrKE8vDUg
         KTKd84xeKrZNaSAiZWm7rmRKoXGXzSiDFZHR2Gc5x8TePLyDtJTpOXze26WhQKmebdND
         0Ou3J772II3irSxWeXqZWwFtLr0jDoiI+eGZicQON2lfU7TaNPT4J7B3VT8aU+U/AnlI
         Jcvg==
X-Gm-Message-State: AOJu0Yxw+hJTwdy5ScH6aVG0HNzPVj17VkcJ2cH6vcdGbPAJuyjqQHnd
	Wva56mgMcI2L+lxG9K30dFzG1A==
X-Google-Smtp-Source: AGHT+IHjXRMZEdB1x3kE2964xEe0bNocuGwTFRGbDGBub0YmkJC68wbE/vYIbPFIPzDWgP9RZ43b3Q==
X-Received: by 2002:ad4:5ba9:0:b0:67f:647a:94c5 with SMTP id 9-20020ad45ba9000000b0067f647a94c5mr4129759qvq.101.1703165151016;
        Thu, 21 Dec 2023 05:25:51 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:d82:b0:67f:ab1:c86c with SMTP id
 e2-20020a0562140d8200b0067f0ab1c86cls982387qve.2.-pod-prod-08-us; Thu, 21 Dec
 2023 05:25:50 -0800 (PST)
X-Received: by 2002:a05:620a:2b9c:b0:77f:c0f5:1bb5 with SMTP id dz28-20020a05620a2b9c00b0077fc0f51bb5mr8375023qkb.105.1703165150532;
        Thu, 21 Dec 2023 05:25:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165150; cv=none;
        d=google.com; s=arc-20160816;
        b=dG4bU0tw2BGEQ1RPjsWDmqbuWT215anK4bh8eqNinT39olgeP0eg9UjsrYUEvLUNuE
         CyiL7nIr1C9jHDtnKLy9OI95H6AicmzmxagWUnoOCmJC9fQadLEYRnEoNFw5E99ogQ3E
         UN0Bxeb29Vntobp5PwjurtGCCk7ZtCEh5vmYQtA8Yt8MJpc2Gqt+vqjo3nRN4P+XIjg5
         1DYAdUmYuIv5IOmZNHW6AtXMFxkK3Y/th8+a3k+X72lqDiUHOd00IOU4LxiAvSNc7LND
         XtRSyhjAA07G1xwqpT1jjOe5SISeUy4d4vA63wXAVy94LdlWL1/3V8+st9vhRIhtkAnd
         vtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=sLOJZBQtHn1jVYDnU489+f18yhPIxwvphTv8wiLd2rs=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=r0UhTRp0y+d74RNPv8sT4seBXNsHIFWb7Dm8vT8K7n2zJ3sRIDOeEe+1LJVloo4PeE
         4uIK7aGjjU6oIUgPdO4+ipOxmPzDL096sH2i6XFayw2oOzcRvw228G3avtxmnDizJNwD
         +WGC9jB3oOX3UGRGBXRhrXC+/SmpXx7Djcyfc4zhZo+A+W9qDTF+rnA5oer/+iAT2aML
         SDy39L0a1+Ocgz6vUzf87WkpmwRyJ4LiF4WJoQl1zp/WJcLPU2HkV8AJVa8PgOpIDQCA
         i12cM2QLwhcF2uTEEICPUoEiTEAWujDxjxJcS6J4qZNsvKtH9olfkVPP23Jq5OwdHTmQ
         tgVg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id l4-20020a05620a28c400b0077efd5a9f39si2402331qkp.143.2023.12.21.05.25.50
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-164-pCo4tiizMieBiyW7GCaiKg-1; Thu,
 21 Dec 2023 08:25:49 -0500
X-MC-Unique: pCo4tiizMieBiyW7GCaiKg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C50DC3830081
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:25:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id C21262166B31; Thu, 21 Dec 2023 13:25:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C415F2166B33;
	Thu, 21 Dec 2023 13:25:45 +0000 (UTC)
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
	Eric Van Hensbergen <ericvh@kernel.org>,
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
Subject: [PATCH v5 27/40] netfs: Allocate multipage folios in the writepath
Date: Thu, 21 Dec 2023 13:23:22 +0000
Message-ID: <20231221132400.1601991-28-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
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

Allocate a multipage folio when copying data into the pagecache if possible
if there's sufficient data to warrant it.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_write.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 6e7f06d9962d..b76688e98f81 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -84,14 +84,19 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 }
 
 /*
- * Grab a folio for writing and lock it.
+ * Grab a folio for writing and lock it.  Attempt to allocate as large a folio
+ * as possible to hold as much of the remaining length as possible in one go.
  */
 static struct folio *netfs_grab_folio_for_write(struct address_space *mapping,
 						loff_t pos, size_t part)
 {
 	pgoff_t index = pos / PAGE_SIZE;
+	fgf_t fgp_flags = FGP_WRITEBEGIN;
 
-	return __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
+	if (mapping_large_folio_support(mapping))
+		fgp_flags |= fgf_set_order(pos % PAGE_SIZE + part);
+
+	return __filemap_get_folio(mapping, index, fgp_flags,
 				   mapping_gfp_mask(mapping));
 }
 

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

