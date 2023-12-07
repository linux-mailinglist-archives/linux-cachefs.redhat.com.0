Return-Path: <linux-cachefs+bncBDLIXLMFVAERBZHPZCVQMGQES77P6UQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA51809372
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:23:49 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-67ab20c5b98sf15527836d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:23:49 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984228; cv=pass;
        d=google.com; s=arc-20160816;
        b=IDmHeUXHQi5qMI4+4WQCUq23Mit+BfOvGt2KcuCZQIfi1OKpGINreCFtkU8b/rH+7o
         HixOoHfP1Dobw8QApml+m6M4bMhtmMZcdVyb4C9pfuxVNatECCj/rlZfuM3MpesY/UK3
         k5RxuMLaSidYQxb7Mqrd6gAtbfeEAJ12hLgjjjXBEo0H+hIRXn4SLFa+oUePvWJmfptx
         TN0CGr9cRN++mem6ogesCnQrswMxsLL/w0sAz9kb02zkNHpFjCm8cHTtDxn7L7SfloL/
         CFCjU0KxvPXCZ8VFW7O/LqN8JsBrG7AFWai67lXbQqMYIpPxPNq5YDHFH+GzYlVF+cpF
         4tFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=8Gi9R+0itA1BGMVWD9YmwysUI59ZR9hgwNcOahEPBPI=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=LeorIGjoJtccPWECnNuK21/KcPip7JAUwKNVvAXjGEVCrj1EnZ16y8sviWlZGFQHCZ
         pzdYdjs/FToft12Oui8JG4Fub3BMRnaRfr6yH/IMPo/zSl48KWXtLjZa7k8E9X5UIzKN
         fLkghUmpYPcWoxBrwIS0UQJB8ViuKc2Jgh18gTKGUPZzOcHuTXMYALzCkFx+GQWB3YGQ
         su7WfHYbhhHZRr4UXn+EbznD5h7XVHwpqGseIUUxTxEbavFHA9Szf7PsRo0gjE/RVfqN
         Uoxqmdxh0rCJeOH/uf5Q9K53XCe0i+V1Rvk2rsZ2rR8sfNSl4JbRY4jcNKhKta6Uze3m
         0NUw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984228; x=1702589028;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Gi9R+0itA1BGMVWD9YmwysUI59ZR9hgwNcOahEPBPI=;
        b=p01kBOWPBLt1kEUbOzbkRzLICq0ZNJ08+wUEL9KmFOkdXirNV7RgdGnpP9LjbRM9DY
         +ESp6Xh9J1+GjfRiYD1UNJ4PS8Pf3BVXFdKy1g8BmSg6hCSlk3TS2jSNqYPORrcr1RJm
         NEL2zJL8YGZ1k3M6mk0oW26srfMGo+Ne/Bk48d36knfuz7rh2uBmp8Jqb8KkhYnfpT8a
         EMQH2EvPZXAdaTNQj99kHaIQl6b3l1wIG/D/m8P3KjUVoPWTmloWg/hVdhYLvj7Z4k25
         b78DhwaqN6H7T1vYYzNrrWXxhcShk6QJobX9EZSNELkUloX+CD4s/oJog1sIjYjjj/iM
         G1Kg==
X-Gm-Message-State: AOJu0YzTqDV3bbBndLdRTcMa/hqiDEMfeYcLXKb8sK0W3BRfSENKkP+j
	H5fM4I3lvMSL9d6DU+50XYld4w==
X-Google-Smtp-Source: AGHT+IF8KovVGfqTJG58DVXH8HlRrGsVGrAbOL3rN9ibxApfOr0jwmoFRlREIINf47DC5YwXg+9T8A==
X-Received: by 2002:a0c:fa84:0:b0:67a:cb1a:ad63 with SMTP id o4-20020a0cfa84000000b0067acb1aad63mr3794793qvn.16.1701984228777;
        Thu, 07 Dec 2023 13:23:48 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa4:b0:421:c71a:9295 with SMTP id
 s36-20020a05622a1aa400b00421c71a9295ls1446848qtc.0.-pod-prod-01-us; Thu, 07
 Dec 2023 13:23:48 -0800 (PST)
X-Received: by 2002:a05:620a:22cc:b0:77f:a79:eef5 with SMTP id o12-20020a05620a22cc00b0077f0a79eef5mr1838630qki.53.1701984228310;
        Thu, 07 Dec 2023 13:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984228; cv=none;
        d=google.com; s=arc-20160816;
        b=yRA3D+WW3yZoZK+d7KWoh8GfQdSZogm0KHPVDxQ8YeCCr43Z1R5W+MKFWCoch2Q1Ie
         uAAuiKrL0GO04+brtpRXXd92K5s6BgQrYSZ5vS+QUw8t56Qd25AefNyfdzsLtYE/N8At
         la7N6B+jvVLGYieGzIoxgMa6e8i41JPEECnGdLBFqEoPJBuMbcuYfKzwYw+BmU9sldOU
         SolT6jQGkgYEyT13BNxV5t0AD7qhyEAJruCy5U1FlSzx1qZftAn+xwA7kjUsjupYI1uX
         6HlJPQmuzuIPOJb7G+q9uR+SZu6Px04QHqhKnx1adbIIG48ReJLdIFll7aQIUX9hhL0x
         iHZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=KbBg4oLyg/4VjucqWLPnAUrUGVI7xibirsiFMNrNygw=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=lsIe6yS7TyJADSax+9GquN/xNWOxFapdhNwEAKbiz443nY2rvAglKmuPfieHprnbek
         aYTx0zQJBWpaf3erGubxNM5Yl7ppddeWJdUq3SCozhg4u0U1aQtYlAbdL/tWep7n6p5d
         4Rq1xC7JyLMfULjLdVReBfo6nQHRwwoYUVbNfUDIWkucqoED0H7ETb9AnkITH7DOrV9q
         m7NHif19oTnyufPR0BUcv4SxMB3ynHIDND6TfWug1UMzHqBeSXC8MPwo8mbX2j0gTua1
         Dk/DaGLA8CmRAMXJ1XMWXc1ixCeCsATxyT2OnRG/WBEKLFEfxhrjl5VpM11+PiYKGJNp
         vQ6g==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id qs4-20020a05620a394400b0077be8e6b007si617008qkn.554.2023.12.07.13.23.48
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-cvYtQVYlPqe8vN5gZ95BjA-1; Thu, 07 Dec 2023 16:23:46 -0500
X-MC-Unique: cvYtQVYlPqe8vN5gZ95BjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E54B85A5B9
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:23:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2BB0B492BCF; Thu,  7 Dec 2023 21:23:45 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A7CF492BC6;
	Thu,  7 Dec 2023 21:23:42 +0000 (UTC)
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
Subject: [PATCH v3 27/59] netfs: Allocate multipage folios in the writepath
Date: Thu,  7 Dec 2023 21:21:34 +0000
Message-ID: <20231207212206.1379128-28-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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

Allocate a multipage folio when copying data into the pagecache if possible
if there's sufficient data to warrant it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
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

