Return-Path: <linux-cachefs+bncBDLIXLMFVAERBT5B46VQMGQEXXTXCSY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 9027481179B
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:42:08 +0100 (CET)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b9e84cee2esf9180575b6e.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:42:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482127; cv=pass;
        d=google.com; s=arc-20160816;
        b=juPMklDaatubGUxF47BdnRHtx+RVu7SAHJVPMqTwDpKB7bOWR5SHNpp2S212oi0U/8
         ZjJacoQjDzvZ1E1gOxlgiTXp2zgikk6xX5l2i3stlU12CM7aDjU8119QGmie1/xmrEzP
         VjS+sExXh669X6mkO/4oaAivL+kznVpl9xG2w/9dmx82p82fpfQy7uBLnVbJsj2DF/ZG
         98rcLJvZPSfcAz36koJMfqDC+90UiBB21wjHDq7NO37bpWUvZ0fZ954IdvVZOiUnApDn
         lOLbTUF6nkyaxcJ6dzuB7zB6nk11krKcf4xO0vMXF0yjiNbx30X8t1YOWxc5f0pxkKYo
         jjnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=84A/LYdZKnKtXOwKBvEWOW3cTdWpc49V/kGf6XyJOqU=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=PkBVQlxba7AMt2qSulaimhXb+k6yPH6NMfK5ehMXzXMAI3l1WEyuV9b4hlsLQ0hQDR
         j5vwk1KzBPPp4/W3U3M2dTVeUcP/sGblyASPaLNcB4BH//loyEJrzKaJz6iVdUFppgEZ
         IfKyAzRquBGo+82khox+olMGTUSsrZIPbO6+vaWpi4yjNWoLQ+cuN9WgPsLu13wHBsM/
         iGRFVcm4x/TPHMTjew0/9tlSlexrQHkdcOwqVrsYsPSwsGkQJXw8GnSeZINSuQ6l3CWJ
         bKxMKmxkSDfFcD+MC9tnxmf2A9q7+1ToWOASxF5+L0cfHYDbwVoOHUhoyyQd+jwgvNPQ
         Eeug==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482127; x=1703086927;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84A/LYdZKnKtXOwKBvEWOW3cTdWpc49V/kGf6XyJOqU=;
        b=KSqwFYftryQIu1nVR2VMYTcqrdNQAtfJYHIH/r4NzZ+3P9VyO6J4nRgbjA0qihXxKC
         aSVVnHYnt+SIVWQrEwnAoMmktezCJjXeQNbxRad/NMDzrqh38ydCF3Gez5MIoDdqWm0Q
         KuSuxwL/Sq5xu59xeEgmwm4ONGlwO7K14RMYpZguEtZKQr8kOaf+qYwCt6WACmUR3MrE
         HEkJduU6c7krhmuLqO2OoA1KL131CsYBoDCWIkA3xPdO0E+fRzmS6pDXvQ3TU5s6Sy8O
         PPCMg5l81bKc9gMHXf5/1q7ltU//dlob2kMSKeYynbXHovYX8KEyih8/SLOUi/zOTzVF
         NMZQ==
X-Gm-Message-State: AOJu0YwQ0whb9KVorTYR74m7g5q0eRCKCVYLCqvOkJP4L/tyPFF/9wOt
	yDRBi5lkArkHcT9DX+KyzuEVFg==
X-Google-Smtp-Source: AGHT+IEE8LNxR6Iiey2vNyjVrPe30Q80qA1qGtmLgZP0bE/VxwKdcuH51SjvlYpv2IuOzBT1JVWayA==
X-Received: by 2002:a05:6808:14c9:b0:3b8:bb80:b36c with SMTP id f9-20020a05680814c900b003b8bb80b36cmr11624168oiw.30.1702482127448;
        Wed, 13 Dec 2023 07:42:07 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1751:b0:423:9554:656a with SMTP id
 l17-20020a05622a175100b004239554656als2346788qtk.1.-pod-prod-09-us; Wed, 13
 Dec 2023 07:42:07 -0800 (PST)
X-Received: by 2002:ac8:5909:0:b0:425:4043:96f8 with SMTP id 9-20020ac85909000000b00425404396f8mr11219859qty.133.1702482126860;
        Wed, 13 Dec 2023 07:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482126; cv=none;
        d=google.com; s=arc-20160816;
        b=rpvS03uflROqsemITNq03kY9TlAWv4eK6O8z7c3459ylJ2nYl7WtgJFxS9ocfCor7/
         StVRsXw2ulQCygACsBcDi7rRnBmBgSSWUL4EHB8OL8mxC0K1UZJnUahqzpXgc1OBWOLG
         qv1qBjtDtcT0nuit22UI2JzCtfqHdH1MqdYb18CE0wjof78On1p36oN+KVHyPJyofeey
         mLUJExzMUwVlg+F13fItXjtEIN2z4b2wFsYgDRonJVy/ebOEkS8DxRynDAtYsx6ijaht
         IxaRic7Fdw0kB2tX4myRzei+zF3h9aMx3spqmIjLqZRQwKkeNkFWGgGMaszCNh5f60y0
         aOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=WWGWFaVybn+Cuwok82Tqy8Z4Nj/F9zUC0bxWKAhhGjQ=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=EHAJuxcM2VDbUJrW1/NSYtASDU8vT1wOPgXJNA2uU6NvBcQrQCgC2QI3f/ExeHp3Pf
         1p55gRX4jCWbjVmSGK5pA5/aXU7PxIQO3BnVzd74XQk0+Sq02zIL8sQJgZCp/NIZ4IP1
         8Dsq4MI/JVKh0BYTSoUQuqZzl5lYS9UdhMAxbizfj9lTV6CN10fKKmxEhQ85hZ8lV1aJ
         o1DHUMMuTEdOt8kR6yHKvE8zGYMB4tkIPMBiD5lAbDuwasslzSWe+TEW1vEYVjJOv9YH
         EqyZ8LWvhQP3/KaFrBRJDMilTmmqOj/25vDPivm3EskR5czPw4CuS+psDayzNNGikhrv
         fURw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bw22-20020a05622a099600b00423737d87d2si13911675qtb.36.2023.12.13.07.42.06
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:42:06 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-M_xbB3HmO7C0vHFB8A3TMg-1; Wed, 13 Dec 2023 10:42:05 -0500
X-MC-Unique: M_xbB3HmO7C0vHFB8A3TMg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB12A85A59C
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:42:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A7E68492BE6; Wed, 13 Dec 2023 15:42:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3785492BF0;
	Wed, 13 Dec 2023 15:41:57 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v4 04/13] cifs: Set zero_point in the copy_file_range() and remap_file_range()
Date: Wed, 13 Dec 2023 15:41:30 +0000
Message-ID: <20231213154139.432922-5-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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

Set zero_point in the copy_file_range() and remap_file_range()
implementations so that we don't skip reading data modified on a
server-side copy.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 078cff36cd2e..ebe04c78a955 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -1337,6 +1337,8 @@ static loff_t cifs_remap_file_range(struct file *src_file, loff_t off,
 	rc = cifs_flush_folio(target_inode, destend, &fstart, &fend, false);
 	if (rc)
 		goto unlock;
+	if (fend > target_cifsi->netfs.zero_point)
+		target_cifsi->netfs.zero_point = fend + 1;
 
 	/* Discard all the folios that overlap the destination region. */
 	cifs_dbg(FYI, "about to discard pages %llx-%llx\n", fstart, fend);
@@ -1355,6 +1357,8 @@ static loff_t cifs_remap_file_range(struct file *src_file, loff_t off,
 			fscache_resize_cookie(cifs_inode_cookie(target_inode),
 					      new_size);
 		}
+		if (rc == 0 && new_size > target_cifsi->netfs.zero_point)
+			target_cifsi->netfs.zero_point = new_size;
 	}
 
 	/* force revalidate of size and timestamps of target file now
@@ -1446,6 +1450,8 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
 	rc = cifs_flush_folio(target_inode, destend, &fstart, &fend, false);
 	if (rc)
 		goto unlock;
+	if (fend > target_cifsi->netfs.zero_point)
+		target_cifsi->netfs.zero_point = fend + 1;
 
 	/* Discard all the folios that overlap the destination region. */
 	truncate_inode_pages_range(&target_inode->i_data, fstart, fend);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

