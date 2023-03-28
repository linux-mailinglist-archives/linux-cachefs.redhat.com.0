Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D436CC930
	for <lists+linux-cachefs@lfdr.de>; Tue, 28 Mar 2023 19:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680024189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0Z+lFEnZr5KmaIFDJlmP88ThOXwM7vlHT5jA9FSkwVQ=;
	b=WiHHA70f6QLqnUI/Nr/tipQG/+sGfDSs6xjyvraIWFpUqNgaU3qd/8mPbOu5BIIvcwV0/0
	ovIcmxyrtrUfDW+CtQnbTh8+1BhrB9Cd/mNpbZzArQH2xNdnH8eGRm19tus48IXvBTasXR
	XH75tQNtrEC87b7MGV7jTzpiAeCvCa8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-cZ10OK2qOgmV7hBnJPjYrg-1; Tue, 28 Mar 2023 13:23:06 -0400
X-MC-Unique: cZ10OK2qOgmV7hBnJPjYrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 093D91C06ECD;
	Tue, 28 Mar 2023 17:23:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13429404DC50;
	Tue, 28 Mar 2023 17:23:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEB731946597;
	Tue, 28 Mar 2023 17:23:04 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 50E54194658C for <linux-cachefs@listman.corp.redhat.com>;
 Tue, 28 Mar 2023 17:23:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1B25FC15BB8; Tue, 28 Mar 2023 17:23:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 139FFC15BA0
 for <linux-cachefs@redhat.com>; Tue, 28 Mar 2023 17:23:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB52785530D
 for <linux-cachefs@redhat.com>; Tue, 28 Mar 2023 17:23:02 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-BU8ZUs_CPe-Bmz8Gi034Ug-2; Tue, 28 Mar 2023 13:23:00 -0400
X-MC-Unique: BU8ZUs_CPe-Bmz8Gi034Ug-2
Received: by mail-ed1-f53.google.com with SMTP id er13so11736123edb.9
 for <linux-cachefs@redhat.com>; Tue, 28 Mar 2023 10:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680024180;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dMXmHQsVcoXJgrM8aqkbsjB3AVZGOKdI9LNYNjA7GOo=;
 b=VabksGS92V3ZRe1yxaf4LGlRjxItLVRf1ADkNjBUFTgwFfyaqNAssUM9kOBeO+9/U9
 j65naziJvb73tZhVRr2CGPz85Do1F9pEGVUl1X8F03ZDB4fNW/izQ1+dJqk5saULMn/c
 xo+YvR2HeOi4ugBdcs5T703wu8h/g0eYPi6swBu/qztaC/8s31P43MaWeRURG4XO30en
 uK7N9lHeNVUI3wEvHJINA/IIEkp0EzG+IAw2LJwqh20FyHpjtDeeMk8WOL1jsOcIGEUh
 OZv3amDSzcmuOtfgo7TJxt/TB+ivfLLmkkTnfo8XhBs9PpGmf2xfYvRU1yyKrLJMzkqV
 jl+A==
X-Gm-Message-State: AAQBX9dh5ublexZZf8XTwNs0PXor/CiIZ2HDOxTRzs5j76JRHETILSk8
 XoY22tH9bXSY5cjAk43vWRFr4oK0AKS0MF3YfeqmKGdHG5irtQ==
X-Google-Smtp-Source: AKy350YL6Jwju8WjJsDXBH4J20X7plPEdUG7cNSqv2dK7/NNvW7gq2AKWVHZYGQqtlEgz/4L14PVg9fxd9TF24gfC5g=
X-Received: by 2002:a17:907:c317:b0:930:310:abef with SMTP id
 tl23-20020a170907c31700b009300310abefmr10222404ejc.3.1680024179809; Tue, 28
 Mar 2023 10:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAmbk-cQNY3Sd9iQ7vghqw_=sk9JsG-_Mf-OM_iRuw+h8j2E_w@mail.gmail.com>
In-Reply-To: <CAAmbk-cQNY3Sd9iQ7vghqw_=sk9JsG-_Mf-OM_iRuw+h8j2E_w@mail.gmail.com>
From: Chris Chilvers <chilversc@gmail.com>
Date: Tue, 28 Mar 2023 18:22:49 +0100
Message-ID: <CAAmbk-dAD65xUNQ5C004rc_AU4qXhYj5NTLzwm7khQr-KV1LYg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] decant_cull_table intermittently aborting
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 3 Feb 2023 at 11:17, Chris Chilvers <chilversc@gmail.com> wrote:
>
> I have been having an issue where cachefilesd will randomly crash causing the
> cache to be withdrawn. The crash is intermittent and can sometimes happen
> within minutes, other times it can take hours, or never.
>
> Fortunately it has produced a crash dump so I've been able to analyse what
> happened.
>
> From the stack trace (and debug logging) the last operation it was running is
> the decant_cull_table. The code fails in the check block at the end of the
> function when it calls abort().
>
>     (gdb) bt
>     #0  __pthread_kill_implementation (no_tid=0, signo=6,
> threadid=140614334650176) at ./nptl/pthread_kill.c:44
>     #1  __pthread_kill_internal (signo=6, threadid=140614334650176) at
> ./nptl/pthread_kill.c:78
>     #2  __GI___pthread_kill (threadid=140614334650176,
> signo=signo@entry=6) at ./nptl/pthread_kill.c:89
>     #3  0x00007fe353442476 in __GI_raise (sig=sig@entry=6) at
> ../sysdeps/posix/raise.c:26
>     #4  0x00007fe3534287f3 in __GI_abort () at ./stdlib/abort.c:79
>     #5  0x0000556d6c9f0965 in decant_cull_table () at cachefilesd.c:1571
>     #6  cachefilesd () at cachefilesd.c:780
>     #7  0x0000556d6c9f140b in main (argc=<optimized out>,
> argv=<optimized out>) at cachefilesd.c:581
>
> For reference the code at frame 5 from the decant_cull_table function is:
>
>     check:
>         for (loop = 0; loop < nr_in_ready_table; loop++)
>             if (((long)cullready[loop] & 0xf0000000) == 0x60000000)
>                 abort();
>
> Checking the cull table, the first object in the cull table appears to be
> valid.
>
>     (gdb) p nr_in_ready_table
>     $1 = 242
>
>     (gdb) p cullready[0]
>     $2 = (struct object *) 0x556d6d7382a0
>
>     (gdb) p -pretty -- *cullready[0]
>     $3 = {
>         parent = 0x556d6d7352b0,
>         children = 0x0,
>         next = 0x0,
>         prev = 0x0,
>         dir = 0x0,
>         ino = 13631753,
>         usage = 1,
>         empty = false,
>         new = false,
>         cullable = true,
>         type = OBJTYPE_DATA,
>         atime = 1675349423,
>         name = "E"
>     }
>
> The inode number from the struct matches a file in the fscache.
>
>     $ sudo find /var/cache/fscache -inum 13631753
>     /var/cache/fscache/cache/Infs,3.0,2,,300000a,e5e9b1269df2b0d,,,d0,100000,100000,249f0,249f0,249f0,249f0,1/@00/E210w114Hg92Az0HAMYCClFMVmkMY050002w1qO200
>
> However, the memory address of the struct matches (fails) the check.
>
>     (gdb) p (((long)cullready[0] & 0xf0000000) == 0x60000000)
>     $4 = 1
>
>       0000 556d 6d73 82a0
>     & 0000 0000 f000 0000
>     = 0000 0000 6000 0000
>
>     $ file /sbin/cachefilesd
>     /sbin/cachefilesd: ELF 64-bit LSB pie executable, x86-64
>
> Looking at the code, I suspect that this magic 0x60000000 number is supposed
> to be some kind of sentinel value that's used as a bug check for errors such
> as use after free? This would make sense when the application was 32 bit, as
> address pattern 0110 in the highest nibble either cannot occur, or lies within
> the kernel address space. However, when compiled as 64 bit this assumption is
> no longer true and the bit pattern can appear in perfectly valid addresses.
>
> This would also explain the random nature of the crashes, as the cachefilesd
> is at the whims of the OS and calloc function.
>
> --
> Chris

Any thoughts on this issue? I think the main question to be answered is if the
debug checks such as "(0x6b000000 | __LINE__)" still have any value. If not
this can be simplified by simply setting the pointer to null, and updating
the check to look for nulls.

If __LINE__ still has value then there are two questions to answer:

1. How to make this safe for 64 bit architectures?
2. Should __LINE__ only be included in debug builds, and null used normally?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

