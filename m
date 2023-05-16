Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C859A705279
	for <lists+linux-cachefs@lfdr.de>; Tue, 16 May 2023 17:43:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684251782;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LhlkVl8DuOsbLnBpYboX8++/Y6fANbwn5ArhaHhuXok=;
	b=Q9qUG/+0opLlLoyZ0iuGBRLi6McJgtUk5AJsPHpK0wdp+5nK1OLD8SGJI1qewV8rg0GO6L
	hdCgcgJjULOuBNgJ1I0VsssEBn31GFcfZZK7LGkBTJEdzdFSmcBIrUrBZU1iaRJITj9uvZ
	x6s1tn9R1dYr1QurZC4g0AoKr96g/FY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-4c3Uyl7bP0O-c1lVHgI4oQ-1; Tue, 16 May 2023 11:42:59 -0400
X-MC-Unique: 4c3Uyl7bP0O-c1lVHgI4oQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC16C3815EE9;
	Tue, 16 May 2023 15:42:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A3E540C6EC4;
	Tue, 16 May 2023 15:42:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0596219465B2;
	Tue, 16 May 2023 15:42:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 365E019465A3 for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 16 May 2023 15:42:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA8102026D25; Tue, 16 May 2023 15:42:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C21782026D16
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 15:42:54 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5C6F185A78B
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 15:42:54 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-03Al8jWINyCHn5lsXdNSfQ-1; Tue, 16 May 2023 11:42:52 -0400
X-MC-Unique: 03Al8jWINyCHn5lsXdNSfQ-1
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-510b6a24946so64414a12.0
 for <linux-cachefs@redhat.com>; Tue, 16 May 2023 08:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684251771; x=1686843771;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bJdGKICWmGv85K5wtQSHIYe7lme/vN6+44Of5jYTNMU=;
 b=KCWau9mm/w9AJoElQ4qaABKscv9SuB7tL7R+xvpmvqlKvaZsW5HyoEULRencvPxsRD
 /sFLp7yS8piU7S7bzwlJsO1xHLAQrDtl1HEE2mkhs3LwzWZ0AsesTU0CpEYPCmrxYWxz
 slpiKdm+xcAwcICIq1HTDEAnxSD/mRXjFraoCEV8YxfV/2GQiWgL1Jzq2aPZHlF3IAe/
 z2IvD4THu7VpCL39YGqq1966+CpVnKpXqNIZujakRh3OgS8yAaVTvgvTQ3ubHXGIAwrp
 6Y+IL+t4X35RBBN81/dn/iQGumNJU+nbwsol6hTZE6N7I/gbnyws1YK1UwM1q+OERKNt
 lQ7Q==
X-Gm-Message-State: AC+VfDzNax/ev8dOiiop2iSSkN5wI+n+Yx/13LO2PV7nOAxJS0/kvvtm
 yuEMtpWXS52nhNdBUSEkBUYu0BMvQEHISKmjjxbPwH7kYGE=
X-Google-Smtp-Source: ACHHUZ7VKppiy6hYOyleXTuQ96f7BodeChTwl7i14yAj3Zq/zNyLxt2UpJEJR6P0RDpZEQU662kK+EGa9etmJm/9c0g=
X-Received: by 2002:a17:907:eab:b0:969:813c:9868 with SMTP id
 ho43-20020a1709070eab00b00969813c9868mr28463819ejc.18.1684251770723; Tue, 16
 May 2023 08:42:50 -0700 (PDT)
MIME-Version: 1.0
From: Chris Chilvers <chilversc@gmail.com>
Date: Tue, 16 May 2023 16:42:39 +0100
Message-ID: <CAAmbk-f_U8CPcTQM866L572uUHdK4p5iWKnUQs4r8fkW=6RW9g@mail.gmail.com>
To: linux-nfs@vger.kernel.org, linux-cachefs@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Linux-cachefs] [BUG] fscache writing but not reading
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: brennandoyle@google.com, Benjamin Maynard <benmaynard@google.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While testing the fscache performance fixes [1] that were merged into 6.4-rc1
it appears that the caching no longer works. The client will write to the cache
but never reads.

I suspect this is related to known issue #1. However, I tested the client
with rsize less than, equal to, and greater than readahead, and in all cases
I see the issue.

If I apply both the patches [2], [3] from the known issues to 6.4-rc1 then the
cache works as expected. I suspect only patch [2] is required but have not
tested patch [2] without [3].

Testing
=======
For the test I was just using dd to read 300 x 1gb files from an NFS
share to fill the cache, then repeating the read.

In the first test run, /var/cache/fscache steadily filled until reaching
300 GB. The read I/O was less than 1 MB/s, and the write speed was fairly
constant 270 MB/s.

In the second run, /var/cache/fscache remained at 300 GB, so no new data was
being written. However, the read I/O remained at less than 1 MB/s and the write
rate at 270 MB/s.

    /var/cache/fscache
                | 1st run     | 2nd run
    disk usage  | 0 -> 300 GB | 300 GB
    read speed  | < 1 MB/s    | < 1 MB/s
    write speed | 270 MB/s    | 270 MB/s

This seems to imply that the already cached data was being read from the source
server and re-written to the cache.

Known Issues
============
1. Unit test setting rsize < readahead does not properly read from
fscache but re-reads data from the NFS server
* This will be fixed with another dhowells patch [2]:
  "[PATCH v6 2/2] mm, netfs, fscache: Stop read optimisation when
folio removed from pagecache"

2. "Cache volume key already in use" after xfstest runs involving
multiple mounts
* Simple reproducer requires just two mounts as follows:
 mount -overs=4.1,fsc,nosharecache -o
context=system_u:object_r:root_t:s0  nfs-server:/exp1 /mnt1
 mount -overs=4.1,fsc,nosharecache -o
context=system_u:object_r:root_t:s0  nfs-server:/exp2 /mnt2
* This should be fixed with dhowells patch [3]:
  "[PATCH v5] vfs, security: Fix automount superblock LSM init
problem, preventing NFS sb sharing"

References
==========

[1] https://lore.kernel.org/linux-nfs/20230220134308.1193219-1-dwysocha@redhat.com/
[2] https://lore.kernel.org/linux-nfs/20230216150701.3654894-1-dhowells@redhat.com/T/#mf3807fa68fb6d495b87dde0d76b5237833a0cc81
[3] https://lore.kernel.org/linux-kernel/217595.1662033775@warthog.procyon.org.uk/

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

