Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 167B3689799
	for <lists+linux-cachefs@lfdr.de>; Fri,  3 Feb 2023 12:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675423071;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wONyKebGvEA5k4hLi10oEELoujNiwJEKdlP3Jc46mb4=;
	b=dz8x6f1ubt5Lz9At7vu72yENEL7KvHTDvcFneu+9PLIQikv6FUyYLN74lSxLvReSWFh5LG
	UVRoIod32RDlf18Z2mxXSxu3DNulzCNH0wcusw8+Z+FPedNkb5ZJagHkzNJ4UUdPmPVM5a
	fANq2bb+gLbslfBdGYNWIKSEkNp0Ap4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-VEstBR15NySRNbtZbVGXOA-1; Fri, 03 Feb 2023 06:17:48 -0500
X-MC-Unique: VEstBR15NySRNbtZbVGXOA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 922111C04326;
	Fri,  3 Feb 2023 11:17:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1941D492C14;
	Fri,  3 Feb 2023 11:17:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C610E19465A3;
	Fri,  3 Feb 2023 11:17:44 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 639F41946586 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  3 Feb 2023 11:17:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8D1B014171B8; Fri,  3 Feb 2023 11:17:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8560A14171B6
 for <linux-cachefs@redhat.com>; Fri,  3 Feb 2023 11:17:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A29C2999B36
 for <linux-cachefs@redhat.com>; Fri,  3 Feb 2023 11:17:43 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-AYppqC6uOsKkAgw_mBe-fQ-1; Fri, 03 Feb 2023 06:17:41 -0500
X-MC-Unique: AYppqC6uOsKkAgw_mBe-fQ-1
Received: by mail-ej1-f48.google.com with SMTP id lu11so14443459ejb.3
 for <linux-cachefs@redhat.com>; Fri, 03 Feb 2023 03:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RXMIxGWTHt172JDXaJQxeWSafemTvTg0DTfBUUEyCwA=;
 b=WCz7+KzgHqxPW6pY0xnE5dQzK/Z4vzJpXBZ2AGCZDmdrLyA4XPO4EXcpfs5XVBNDkX
 WA3BI/6fQM5sXLJQMblVlZQaxH58AxZ6exD2s5NOZM0NSmmMmDyuabxJuJPUEiPfoWx4
 TGErK8XxbbuYQzlMzuoPO0P8dpNYbf5KjV70yaFGjRMGSRjJaVpMtm0kG8Dr7n29kvXR
 1iISW/gQYditFctXiHF6SZ49nU/tSyF1EwuONcpLA3YbVrkI1uJS7v94UFviYx6znyLZ
 pqXR3tpywimdwpMEfWvP2yHcH7aUbU7kGPt8ItQd1DR598O6DCoOvC382Y2F2n1aqYVB
 eCZQ==
X-Gm-Message-State: AO0yUKWxCDs/wRlPElzisF6fuwDfE39I7/3Fo1rfqhl8geJ7XrM5ME9c
 OhE0lL1cs+dXO52CTCi4C8VEYvx8nTtiF/BiTb3qG8jSuX8=
X-Google-Smtp-Source: AK7set84Kytl/a2P+O8yDDRZvotwv8O3vOIyHe3YdFXDdsyrL5jCMIUI17OvPT48+SlzDsIWaL0tRdoxzcLVgl9II1s=
X-Received: by 2002:a17:906:22d4:b0:878:6643:9754 with SMTP id
 q20-20020a17090622d400b0087866439754mr2916996eja.46.1675423060132; Fri, 03
 Feb 2023 03:17:40 -0800 (PST)
MIME-Version: 1.0
From: Chris Chilvers <chilversc@gmail.com>
Date: Fri, 3 Feb 2023 11:17:28 +0000
Message-ID: <CAAmbk-cQNY3Sd9iQ7vghqw_=sk9JsG-_Mf-OM_iRuw+h8j2E_w@mail.gmail.com>
To: linux-cachefs@redhat.com, linux-nfs@vger.kernel.org, benmaynard@google.com,
 brennandoyle@google.com, tom@gunpowder.tech, daire@dneg.com, 
 Chris Chilvers <chris.chilvers@appsbroker.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Linux-cachefs] decant_cull_table intermittently aborting
 cachefilesd
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I have been having an issue where cachefilesd will randomly crash causing the
cache to be withdrawn. The crash is intermittent and can sometimes happen
within minutes, other times it can take hours, or never.

Fortunately it has produced a crash dump so I've been able to analyse what
happened.

From the stack trace (and debug logging) the last operation it was running is
the decant_cull_table. The code fails in the check block at the end of the
function when it calls abort().

    (gdb) bt
    #0  __pthread_kill_implementation (no_tid=0, signo=6,
threadid=140614334650176) at ./nptl/pthread_kill.c:44
    #1  __pthread_kill_internal (signo=6, threadid=140614334650176) at
./nptl/pthread_kill.c:78
    #2  __GI___pthread_kill (threadid=140614334650176,
signo=signo@entry=6) at ./nptl/pthread_kill.c:89
    #3  0x00007fe353442476 in __GI_raise (sig=sig@entry=6) at
../sysdeps/posix/raise.c:26
    #4  0x00007fe3534287f3 in __GI_abort () at ./stdlib/abort.c:79
    #5  0x0000556d6c9f0965 in decant_cull_table () at cachefilesd.c:1571
    #6  cachefilesd () at cachefilesd.c:780
    #7  0x0000556d6c9f140b in main (argc=<optimized out>,
argv=<optimized out>) at cachefilesd.c:581

For reference the code at frame 5 from the decant_cull_table function is:

    check:
        for (loop = 0; loop < nr_in_ready_table; loop++)
            if (((long)cullready[loop] & 0xf0000000) == 0x60000000)
                abort();

Checking the cull table, the first object in the cull table appears to be
valid.

    (gdb) p nr_in_ready_table
    $1 = 242

    (gdb) p cullready[0]
    $2 = (struct object *) 0x556d6d7382a0

    (gdb) p -pretty -- *cullready[0]
    $3 = {
        parent = 0x556d6d7352b0,
        children = 0x0,
        next = 0x0,
        prev = 0x0,
        dir = 0x0,
        ino = 13631753,
        usage = 1,
        empty = false,
        new = false,
        cullable = true,
        type = OBJTYPE_DATA,
        atime = 1675349423,
        name = "E"
    }

The inode number from the struct matches a file in the fscache.

    $ sudo find /var/cache/fscache -inum 13631753
    /var/cache/fscache/cache/Infs,3.0,2,,300000a,e5e9b1269df2b0d,,,d0,100000,100000,249f0,249f0,249f0,249f0,1/@00/E210w114Hg92Az0HAMYCClFMVmkMY050002w1qO200

However, the memory address of the struct matches (fails) the check.

    (gdb) p (((long)cullready[0] & 0xf0000000) == 0x60000000)
    $4 = 1

      0000 556d 6d73 82a0
    & 0000 0000 f000 0000
    = 0000 0000 6000 0000

    $ file /sbin/cachefilesd
    /sbin/cachefilesd: ELF 64-bit LSB pie executable, x86-64

Looking at the code, I suspect that this magic 0x60000000 number is supposed
to be some kind of sentinel value that's used as a bug check for errors such
as use after free? This would make sense when the application was 32 bit, as
address pattern 0110 in the highest nibble either cannot occur, or lies within
the kernel address space. However, when compiled as 64 bit this assumption is
no longer true and the bit pattern can appear in perfectly valid addresses.

This would also explain the random nature of the crashes, as the cachefilesd
is at the whims of the OS and calloc function.

--
Chris

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

