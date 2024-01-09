Return-Path: <linux-cachefs+bncBDLIXLMFVAERBB4U62WAMGQERVJRFII@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 98525828BB4
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 19:01:44 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-429a7149210sf7663071cf.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 10:01:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704823303; cv=pass;
        d=google.com; s=arc-20160816;
        b=CzQkb9+q2TeyKB1NHmtX2r7AOMyxweqKlGL6PCaCjqHVHCIr/iteuISikLOT+hZbdY
         gkVv3WblSr6l9Kx7GCteSwb4IPvAxK/hQeDSim1j27olN1vRe7SR7xlo9wxrapROvkSt
         Sob6zYN1q2f2+9+70sK1AzgzJAMf0CVebVA1aDDnWkkcCtwzgRTo02sNxzAtICVkzt/N
         xbfMeqlvCW4qgp8n3yHt/za1yo9KT1+jicqYsG0bXKpz4BmQShYEKhCDhPEnZ+lUV9H+
         hA5ASkC/7jMxiiMII11xpkZ3qyhTB2OhAOi7N4bJHc2dNWdgaWQ6vEM2qgEO+uBVBIG9
         QPjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=zeJqxUz/IP8DhcdhCenROHZlC4I/vAJRTuPn66vaw78=;
        fh=7FeHu9l3h/LcPrN6dirNTNfvY8z6bMb/mXIEfzedng8=;
        b=FF/pCBLpSC4rFfWICbLixZZq2wFD2uLoG0O451Vz1IwLwa3DzC1oMEejnbnpW/kmoK
         7BtXi6HypjdhI63tmfyRtrLKaEdiD6nMRJesOqEF5VPEcHENrC7aNQdaQTVmbXN7SyF3
         eWJNu6jak7e6kJ4GiypSiCdW31w4eNZ2NzYgX6nCUO1DpZdw+4tKAcux0Pf2gcKMXe16
         h79Z5rVZHytEN+8eUPsZOw+aI2PCofnOOqgTIcejDFRT3mE16Tw9VngXeZZ0hAr7VX+s
         Imm48vjPZo06SnqALJe2Roh76ITgcYs8X9ARCpK+Rln/pIgA+YUqhh3jbHaCZ8f9Pc5q
         pQ7A==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823303; x=1705428103;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeJqxUz/IP8DhcdhCenROHZlC4I/vAJRTuPn66vaw78=;
        b=BIPD1i4fdlVqj9wwjUy3bPkH3jE5Z/dLWdy8PcmxRtxYy1yy2ZhmzXRfEyn4Sz32Eg
         tw85sq5Bob8eQcwCnQQJVMu518Ls+fZe37a6jfBRFYgg2+Pmyqi25htYKPYDdcTi/laP
         nSNCRlMKPmPDHHQUKiynti6pmOFnQ/xu345HtAWjiCnJVYOqmF3Q+HdTZxp9kk5KBEWz
         LVUunHzVRqpd9AuMnf15xGpNM2OOAad8OFzZWZdnUJnEEB8HIgvlTlyY72PXHxksZzVp
         ptPQMyW01e7bWO9EsF97U0cKlxpGLh9OCy54LpWn0MIpPjLt+HgbKnoT6Ta7Xtqr+sFc
         xYFA==
X-Gm-Message-State: AOJu0Yy4roh1O6qg0zJBwgGP6nFEdf0GdpiygZTaqF6NSSaUX4nYfiKS
	HPnCIVkoCh1csBqKWlo4FtTluSMWxXKtQQ==
X-Google-Smtp-Source: AGHT+IFchJb8Bvd+fOlDO1orZE/QZTRUqWNU07DoJ3q1uqEDK+5siHGufuhLGXq9tcbzA5cLU26mZA==
X-Received: by 2002:a05:622a:92:b0:429:9727:1672 with SMTP id o18-20020a05622a009200b0042997271672mr3679515qtw.23.1704823303517;
        Tue, 09 Jan 2024 10:01:43 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:6899:0:b0:428:3d71:21c6 with SMTP id m25-20020ac86899000000b004283d7121c6ls2982966qtq.2.-pod-prod-03-us;
 Tue, 09 Jan 2024 10:01:43 -0800 (PST)
X-Received: by 2002:a05:620a:1643:b0:783:3323:ad1e with SMTP id c3-20020a05620a164300b007833323ad1emr364890qko.21.1704823302792;
        Tue, 09 Jan 2024 10:01:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823302; cv=none;
        d=google.com; s=arc-20160816;
        b=gVY32Yge+re55re5eyIOzoLEk7uUym990IvbSLqBebkgv4Try7ZvwkCYuQDe2YMNRI
         PyiJPWg1O+VjArqwMO2XaW7WNRzcUFA39a+oDPEXY9DC9F0jPe+jSvO0mJt5yAwg9qri
         kuNloq6z3dyOuTk8iLtCMC/9ii+ZvL7VlypI2gLo5nFfonjSwUke6px7UKj+2n7HB6oR
         QzxZappXARa9EY5FvUrhduVYPb0AkcsY8MdhDZ7TFCtXu6YsqAiCothGNCQbWEUR3D3x
         Y+Kochh5ox8Etk6StHdWZieOBuY+AIAP9AkLojK3j7llDnLdA3yq+9l9V0rOO3OrKBjW
         dX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=htZaU1/QSRuOWh3B5AYLSVZDvmENK74hhmVyyviJXCk=;
        fh=7FeHu9l3h/LcPrN6dirNTNfvY8z6bMb/mXIEfzedng8=;
        b=WmCINQG0WtDkQFNOS9znBeEtaWrijbuQ5D24vrQ8f5yOSX2RKxCgxAchEadFjuMn4B
         dTlOe/1aWDuS4QCsITvz/VTrpFDYtkH37L/HiQTltVeX7cBeNveNmecvay63iwqIGcNP
         fy836bPM5HJr9CgDR3fw86aTvF4ug9ENAqD0Vn8loFhSZSLbw198EozzQi8KIiwWX2Gj
         6GvnvaeWRWvCGXN5J4RyUTWqrhpdDDRVjruxYfcr2TAO+zqYw31jaJv2xqHF0zWrlzmz
         XvEG/IoF4vF0Mvzx664VslAxrzQei+WJcSlB0gfbpHyRFtBzXOkJby6Hriv3hW9hD5Da
         6pFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id v9-20020a05620a440900b00783092a82desi2644965qkp.687.2024.01.09.10.01.42
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 10:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-hxFNKDHxPI6kR7TqevmMTQ-1; Tue, 09 Jan 2024 13:01:41 -0500
X-MC-Unique: hxFNKDHxPI6kR7TqevmMTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 080F810334AD
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 18:01:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0470C1121313; Tue,  9 Jan 2024 18:01:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C01671121306;
	Tue,  9 Jan 2024 18:01:37 +0000 (UTC)
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
	Steve French <sfrench@samba.org>,
	Ronnie Sahlberg <lsahlber@redhat.com>
Subject: [PATCH 4/4] cifs: Don't use certain internal folio_*() functions
Date: Tue,  9 Jan 2024 18:01:15 +0000
Message-ID: <20240109180117.1669008-5-dhowells@redhat.com>
In-Reply-To: <20240109180117.1669008-1-dhowells@redhat.com>
References: <20240109180117.1669008-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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

perl -p -i -e 's/folio_mapping[(]([^)]*)[)]/\1->mapping/g' fs/smb/client/*.c
perl -p -i -e 's/folio_file_mapping[(]([^)]*)[)]/\1->mapping/g' fs/smb/client/*.c
perl -p -i -e 's/folio_index[(]([^)]*)[)]/\1->index/g' fs/smb/client/*.c

Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: Steve French <sfrench@samba.org>
cc: Paulo Alcantara <pc@manguebit.com>
cc: Ronnie Sahlberg <lsahlber@redhat.com>
cc: Shyam Prasad N <sprasad@microsoft.com>
cc: Tom Talpey <tom@talpey.com>
cc: linux-cifs@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---
 fs/smb/client/file.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index b02b7f0a47dc..253e06a7875e 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -87,7 +87,7 @@ void cifs_pages_written_back(struct inode *inode, loff_t start, unsigned int len
 			continue;
 		if (!folio_test_writeback(folio)) {
 			WARN_ONCE(1, "bad %x @%llx page %lx %lx\n",
-				  len, start, folio_index(folio), end);
+				  len, start, folio->index, end);
 			continue;
 		}
 
@@ -120,7 +120,7 @@ void cifs_pages_write_failed(struct inode *inode, loff_t start, unsigned int len
 			continue;
 		if (!folio_test_writeback(folio)) {
 			WARN_ONCE(1, "bad %x @%llx page %lx %lx\n",
-				  len, start, folio_index(folio), end);
+				  len, start, folio->index, end);
 			continue;
 		}
 
@@ -151,7 +151,7 @@ void cifs_pages_write_redirty(struct inode *inode, loff_t start, unsigned int le
 	xas_for_each(&xas, folio, end) {
 		if (!folio_test_writeback(folio)) {
 			WARN_ONCE(1, "bad %x @%llx page %lx %lx\n",
-				  len, start, folio_index(folio), end);
+				  len, start, folio->index, end);
 			continue;
 		}
 
@@ -2649,7 +2649,7 @@ static void cifs_extend_writeback(struct address_space *mapping,
 				continue;
 			if (xa_is_value(folio))
 				break;
-			if (folio_index(folio) != index)
+			if (folio->index != index)
 				break;
 			if (!folio_try_get_rcu(folio)) {
 				xas_reset(&xas);
@@ -2899,7 +2899,7 @@ static int cifs_writepages_region(struct address_space *mapping,
 					goto skip_write;
 			}
 
-			if (folio_mapping(folio) != mapping ||
+			if (folio->mapping != mapping ||
 			    !folio_test_dirty(folio)) {
 				start += folio_size(folio);
 				folio_unlock(folio);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

