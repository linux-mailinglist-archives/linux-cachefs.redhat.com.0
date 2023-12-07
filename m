Return-Path: <linux-cachefs+bncBDLIXLMFVAERBMHQZCVQMGQEFI5QU5Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mail.lfdr.de (Postfix) with ESMTPS id E44AA8093A1
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:25:05 +0100 (CET)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5d351694be7sf16235117b3.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:25:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984304; cv=pass;
        d=google.com; s=arc-20160816;
        b=eIagLtTCj/VEIR8yQtKxQWNu0uCXsyceEhUqe4xBWAX94Hm1BC7hsMU0t4CzV3zKyM
         /sMAXwfRILeUZq1gC42ncSQxHwv+6EUFNczmNj9i+xMd6VmW6nu/dm3rpE3z10PGH1mu
         twzjOiSXbMJO3pCUU8XZpVkMQmYgytJY6ftbYvxXJReW2cZeQpNl+lZKe6fgqxZ7AeP+
         8eYeNQNBPZ+/1JaNi3pj+Om5ZexShIRXeQopnF0F3dqA8jkWuqy6a6CdABjEbsmzhBSx
         XXOMFVqj3sLvL/ULG85Use5eipOxZ/5Hbn+1i2pWdQSK40oVs6le5YFf1F/4IW/rBKQp
         6nRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=84A/LYdZKnKtXOwKBvEWOW3cTdWpc49V/kGf6XyJOqU=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=DxGiklgNJHlskKEVSWcTVnnfeJUp12s5yCwJ7k47ozAYaxP8grS8TvC/8D49n31eXy
         RYtBtLOtDq16b0AETvQCgQdDnIUJqhbsPAwIm72jLv2blFb70bJOFt4pMqiUEEJbecbF
         hgMZePL7ANPBKnZP0cDGJsuGzG89J3THjda5zNxgHQAiFBiYRsA7YuIk/Q/69/EvC6RK
         cyhoA7OZUGnbjkAQXqMmhEeSq39W2DYm5TMnPimDBXWNZ/72zHLVxKEIkEFHYUSSMI4f
         G1XvqTLbrMJLX3JCcm6mesxo0DFTNi6zlUWjur8smw1AnbiNBG9moUHBqdNzdstUOa4l
         5aNg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984304; x=1702589104;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84A/LYdZKnKtXOwKBvEWOW3cTdWpc49V/kGf6XyJOqU=;
        b=Zg6Cy/SpGqdSPnhHr7mcEaYPpiZCANIoTC5FWYvheWLI70TmPrci0RMdoXBYPYVT5S
         Sin3rsabYFMLTYUVJK6TzzzAsaaz+FCRvEmyb5IX0oVUSyUoqB+tPJXbo5pzX+EJFmxe
         x4VOvnkUhzGS9e0V4L0k1Z7c+vavI57CDCy7Xo3PsbOQYexewBJfPMKbr6sfoV+x7LWs
         Qr33e5UOSaMgTi1xQrRFwA0EjtWYWx8u5sANg3PQivuD+3amO165UXLI+c7d+Qlu27Og
         dUMXV8NMjuv+8iwNtl2Iu/QN0WvpsSXa5L2bIWtKeHkrCtSYCZW4cOJ5CXGEEDLGO+f6
         zEZA==
X-Gm-Message-State: AOJu0Yx+HV6oJBLK6SZKT8CyVQNYdTnWglbGciuZGPBSXWog8qNInUBg
	32jRpSQN+EXojqvZEsglT4gBTA==
X-Google-Smtp-Source: AGHT+IHsJeR5GVQvTVSwpi3ybkxf8K8hrTYqDqrXyS01tNU3vbakZ/JoXsjikPHqzBbYHPvGymZUlg==
X-Received: by 2002:a25:2642:0:b0:db7:dacf:59ff with SMTP id m63-20020a252642000000b00db7dacf59ffmr2954618ybm.115.1701984304774;
        Thu, 07 Dec 2023 13:25:04 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:2b50:b0:670:a1c0:e4e2 with SMTP id
 jy16-20020a0562142b5000b00670a1c0e4e2ls1261468qvb.1.-pod-prod-04-us; Thu, 07
 Dec 2023 13:25:04 -0800 (PST)
X-Received: by 2002:a05:6214:18f0:b0:67a:a721:b1bd with SMTP id ep16-20020a05621418f000b0067aa721b1bdmr2704614qvb.120.1701984304230;
        Thu, 07 Dec 2023 13:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984304; cv=none;
        d=google.com; s=arc-20160816;
        b=cjHxqec2SvmJ0R+TFdrfv+6p0qbWaiILf3ckBKAMS9K8aofRXyGdcdzIIZO9SmKV1D
         9GMiNh3ofRGAlodaAugRSqXUlmBdBG7Ck4bUKBMGlk2tSWSHjWy/ikXrK4/HtZGEzX3C
         c6qu8/wHb1RDwPdwZmpITnTDHNaBoM68komZ1ZRgdte7THpYaqj5w3nHo+6JkVRXCBVW
         Ziv6D0UvnVvSyEtOO+E70q+2TnPBIGUL1yDYctPw2/aOzKjZHCW3u/ISxnHAeZhONmVj
         wg71uYU7PZfIujEXGu8SVehauXbt4awSSSbYbHY0r0wGvOFSSNFF/77fRdALc/UfKWDs
         YKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=WWGWFaVybn+Cuwok82Tqy8Z4Nj/F9zUC0bxWKAhhGjQ=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=pGNvSBtiOR96UdQpezC3+A1dUBypL+rsLP/YhDRaiFTthYt8XtRHL/2N1jE4Yzag5D
         D7PDbUDTNO64zVoRXwn/3ao61jTSW5yySNUZpcM3+Zv3OKiIXNN40Cp928hW6l3sDy1j
         dG0I0tX1MNkMcYEhpdv36T9xMuTNEXHKrZhGX9ZE10auleVaefeM5TAC41/02y2W21hv
         wl7k0/oi3rRGkyayDUfSo+LJy3hrIn24aBI1GitC25kl7/czg3qS79pi60rbXMQxySgf
         CmXYpJWgdC91mW9w28GORfRYZTF39VziCeyb4uvLq1SDlOqlfVgU5J3XHdWRE9gUz6Fe
         qRKA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id o5-20020a056214180500b0067ade25e778si627468qvw.468.2023.12.07.13.25.04
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-675-QT4gP6E7PVize8Y5myiocA-1; Thu,
 07 Dec 2023 16:25:02 -0500
X-MC-Unique: QT4gP6E7PVize8Y5myiocA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69B933C40B56
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:25:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 66D53111E402; Thu,  7 Dec 2023 21:25:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 78F85111E400;
	Thu,  7 Dec 2023 21:24:59 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v3 49/59] cifs: Set zero_point in the copy_file_range() and remap_file_range()
Date: Thu,  7 Dec 2023 21:21:56 +0000
Message-ID: <20231207212206.1379128-50-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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

