Return-Path: <linux-cachefs+bncBDLIXLMFVAERB5VMXGWQMGQEXHWFS5I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com [209.85.219.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20A836285
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 12:50:16 +0100 (CET)
Received: by mail-yb1-f200.google.com with SMTP id 3f1490d57ef6-dc221ed88d9sf3960267276.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 03:50:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705924215; cv=pass;
        d=google.com; s=arc-20160816;
        b=PYYxefhQgRhr2TuvS6SJwZfovbGxQX1cbhS/O5M+g7U+OnDw9VZEv1cJktsYhZztFR
         B6NAH+DkhbG5IBJgs0+znrwMyVnfHheD+P4bvJPKrayYG0gLHUsGC6vBxwmMys+fuXQ/
         tkXgo+ApSKxXbB7tYklGRaDzFI+EzAbsi+9LwJgE8wAY7OjmupyUdl3wGRTfJFJld3mE
         +xoXDcpIuyZfBQ9uB3b2j1SfDwM5H/xwkir5/MuvHUW6/saxE/FODH6IuGS+SEo56/u+
         qsHHxKWVsj1w/comji2y/SCK35M1LbnCBUEZ8qNuaNSxdNzbDXG/wbCO8Cl7oBjVm7mb
         gUxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=2O+MFIBvTQM88jXhelW+mVBebNjmL5FIjNK1uZQdGek=;
        fh=elD4KjhNnBKuca8s87WnzMoUuDmjcV8Jeyt4WDaVfww=;
        b=XQ1nkOnv931kMSXT3aw71bUFj4xs5N0zxLKtBvuXPusjvZse+4j8rGqcckUP2nHr7N
         iie3FNb0v9vrsvTq1aTmQn0IvuzWcXrWym7v5vjJg2pLZCCq/in5esKWafVXDmIlLpNk
         Ch6XWwpvKSLBo7Bwwqvswy8YniGzCM6/frG3W7/jCkAojEXe5yT33U55CUoFb2q0ehU/
         YddztwhzmMsUWJMb7zT+mSQF69x2YEz3bNfSqq6bx73TMt31i6qLAiZ4eWYyUd6eUT6I
         E9h1xiMVtAntdSwqy6klsM5NcDwdSzrs8943V+g4naI2QgqFRsba0mnu1jaDkKLx6qLS
         /ZHQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705924215; x=1706529015;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2O+MFIBvTQM88jXhelW+mVBebNjmL5FIjNK1uZQdGek=;
        b=kEGesXZtB/TlOt93YuAOLumdSmbXhfACHHYNGtAygj18iqqhAp+kcxMr8YrVKLfQy/
         fmfH6REca1qEB+IOXnh+LfSiHmnvT3/DE1mLbXMx1YclXyjVo6YLkCPyMAvQGcA6PJvE
         71uZhS/fzm1odczRDjSviF0fD/xC7steQEpAQ0GUlMuXE8fPEUzqtNQulFBDFdjaiPFi
         jxipbI1T9OEKfEDIivWe62fdH3BYOGvsBZsb06C+UbsT8C6TqJ0uS2CbYqLGuNBN7wfW
         pUuMH2nx8F01ZPB10/jxx9DdOVquPnPcslNSIFiO55xSZ7PubITtuS57tknKk+3F0qqB
         Pb6w==
X-Gm-Message-State: AOJu0Yw2pwjeBa8i2mbqbF336Pg6Y321QYUbW9stgW/IX3Z1Ep6m9apc
	4UnRUTQVp3CK2eTpZ4CKYOVZSdSuZQc9SNYRsGG9qqiSGdSTLI3iNtdIDuq6MZE=
X-Google-Smtp-Source: AGHT+IHVWG+6To3++IqbdXTGJ81joQMNAXoETu3BXtMKQn/pW4jFJ0ioIScNNX5C8we2V1QIe0ea9w==
X-Received: by 2002:a25:d0cc:0:b0:dc2:4d3a:af7b with SMTP id h195-20020a25d0cc000000b00dc24d3aaf7bmr2319968ybg.51.1705924214936;
        Mon, 22 Jan 2024 03:50:14 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:dfc7:0:b0:dbe:9c83:a084 with SMTP id w190-20020a25dfc7000000b00dbe9c83a084ls1404077ybg.1.-pod-prod-04-us;
 Mon, 22 Jan 2024 03:50:14 -0800 (PST)
X-Received: by 2002:a5b:187:0:b0:dc2:54b1:4dae with SMTP id r7-20020a5b0187000000b00dc254b14daemr2050858ybl.87.1705924214228;
        Mon, 22 Jan 2024 03:50:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705924214; cv=none;
        d=google.com; s=arc-20160816;
        b=WZQrzUV/ISJoOBLeIc1eDwaSqzIKLrZvnDqbQTEvZTfeAHNwomiD0CZXcxm6MKzXHA
         PjYjjcxnRVn0xfs+avlTsXh5N5U8tQLUIiDV77CsL2bgWrc4EqTk8cyFgLHhvzHaAmzW
         Fisw2us4DBs1TDAc4q3254Q48jp3m6FjyHK8QkDkTh6k/rwWhM3QDegqMyrBgggZsM5n
         +TExYH4UTdt1tPrjnuwiTecFNnW+COVGhwAMRTgImqgWxAjbuRWFJjUfh1dHCskwtX9w
         BfB00k9AEwq/pxC0ZNKtiwwcppZ6+IUwvcweAZWloY+fnMEH5CMD6h6sDyF3xBJpib5t
         +ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=qWBG3EUB+eR+nnWK36e3AyikYbZKtHzO5qoTjiHlzFA=;
        fh=elD4KjhNnBKuca8s87WnzMoUuDmjcV8Jeyt4WDaVfww=;
        b=wf3D8qgAU/wgNGxT4UpotQv1Fk4cAkvzUXXIWYq7NDqXS982pdHFYwFvz2rg0CYFa9
         m44NBz5jaSfpCluvbHlk/zias3UBEKC7K9xB2oqtgbvAeBkYGmx1Q5AZZ8p1t19eCm/t
         mQ265cc9T6VFPdph3+QFVBL3+aX1i8s5MNF3Q2EzRpc/grqGcdMZVXcRZdOx5xXsr5Vp
         iUPUD0+0NRMIin2NswJW5x+c2hja28L7/2M9wrs4OP6306fl0YXf6ZgevmYoNBYStQF4
         CdhOtJ56PBx1kLPj+L8vYFQ4WCTa1wggkKNkgyhRyqHIsXClDohnk19wxKJTpj/kyPwE
         SXTw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id h1-20020a0cf201000000b0067f2c23a115si5386816qvk.163.2024.01.22.03.50.14
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:50:14 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-452-cityZ2b2Mg6FOGRJ9uKI4g-1; Mon,
 22 Jan 2024 06:50:12 -0500
X-MC-Unique: cityZ2b2Mg6FOGRJ9uKI4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07B9829AB3EA
	for <linux-cachefs@gapps.redhat.com>; Mon, 22 Jan 2024 11:50:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 04F5A111DCF3; Mon, 22 Jan 2024 11:50:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E527B111E40C;
	Mon, 22 Jan 2024 11:50:09 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netfs@lists.linux.dev
Cc: David Howells <dhowells@redhat.com>,
	Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] netfs, cachefiles: Update MAINTAINERS records
Date: Mon, 22 Jan 2024 11:49:59 +0000
Message-ID: <20240122115007.3820330-1-dhowells@redhat.com>
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

Update the MAINTAINERS records for netfs and cachefiles to reflect a change of
mailing list for both as Red Hat no longer archives the mailing list in a
publicly accessible place.

Also add Jeff Layton as a reviewer.

The patches are here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/

tagged as netfs-lib-20240122.

Thanks,
David

David Howells (2):
  netfs, cachefiles: Change mailing list
  netfs: Add Jeff Layton as reviewer

 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

