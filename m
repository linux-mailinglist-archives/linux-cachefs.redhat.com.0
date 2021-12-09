Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5406846F67A
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 Dec 2021 23:08:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-TbbUNGghNc-AAP2kxX_Olg-1; Thu, 09 Dec 2021 17:08:03 -0500
X-MC-Unique: TbbUNGghNc-AAP2kxX_Olg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C73994DC6;
	Thu,  9 Dec 2021 22:08:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D99E5BE0F;
	Thu,  9 Dec 2021 22:08:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF9CA1809CB8;
	Thu,  9 Dec 2021 22:07:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B9M7uWg013523 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 9 Dec 2021 17:07:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44820401DBD; Thu,  9 Dec 2021 22:07:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40F3E401472
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 22:07:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 258911C2A8C8
	for <linux-cachefs@redhat.com>; Thu,  9 Dec 2021 22:07:56 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-99-pxdejEEKMUqUUtlJoGMSXQ-1; Thu, 09 Dec 2021 17:07:54 -0500
X-MC-Unique: pxdejEEKMUqUUtlJoGMSXQ-1
Received: by mail-ed1-f47.google.com with SMTP id y12so23533891eda.12
	for <linux-cachefs@redhat.com>; Thu, 09 Dec 2021 14:07:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RHArNxFMHgs9P3JmMQUjRcZVsX1YeVD3wW/DAeZt5nA=;
	b=yFyUy8eq5GiBktwsje4yRm0a5cFI5ZjB7LOs77iSGOoY1Pv7fzUqYLneAzP3b/DIgH
	KQMFKcE6odVH+xuNR00fVhOkaPp12RMzhIhX8ueCLNeE5xWOueE1XY0sHZFnrucQbe/4
	Af0w3QD/w6hI3Vjj2YJSy+jV7ieIRP1gc++G/poyj7Todb2uhTUiM9AZRRiTqze9RMOA
	4doqRKixdfDzgVmnhrDMDJKxA2fP6x7Yaj0NxryffT6kPZJ1tFJKxqh1oM3jAiOsNh4C
	K6S/+82z9yN83KmQrv8OaXrujU8GWx44UaxvMUHfaLQT9c0rhV1o7m1oW7kh9S3PX5sk
	PJpg==
X-Gm-Message-State: AOAM532gg33UWMtKpFLW2Zcxr1QsWJ2aXhz1ZFIkkzWcCcDyUUE1qy9H
	21FUak5WI4UskFkGTjXTdy1ggvw+fmBk+F7w0kU=
X-Google-Smtp-Source: ABdhPJy13mdAaEW/iLS7Tw/oQ4SY8aXkv44Q4IL5EO/LBzFYbYUpjDW30bK0zYtB7QHiMHlwgzlwNw==
X-Received: by 2002:a05:6402:1a58:: with SMTP id
	bf24mr32907031edb.16.1639087672546; 
	Thu, 09 Dec 2021 14:07:52 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
	[209.85.221.46])
	by smtp.gmail.com with ESMTPSA id j17sm507548edj.0.2021.12.09.14.07.49
	for <linux-cachefs@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 09 Dec 2021 14:07:50 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id q3so12091766wru.5
	for <linux-cachefs@redhat.com>; Thu, 09 Dec 2021 14:07:49 -0800 (PST)
X-Received: by 2002:adf:f8c3:: with SMTP id f3mr9535285wrq.495.1639087669394; 
	Thu, 09 Dec 2021 14:07:49 -0800 (PST)
MIME-Version: 1.0
References: <163906878733.143852.5604115678965006622.stgit@warthog.procyon.org.uk>
	<163906888735.143852.10944614318596881429.stgit@warthog.procyon.org.uk>
	<CAHk-=wiTquFUu-b5ME=rbGEF8r2Vh1TXGfaZZuXyOutVrgRzfw@mail.gmail.com>
	<159180.1639087053@warthog.procyon.org.uk>
In-Reply-To: <159180.1639087053@warthog.procyon.org.uk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 9 Dec 2021 14:07:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=whtkzB446+hX0zdLsdcUJsJ=8_-0S1mE_R+YurThfUbLA@mail.gmail.com>
Message-ID: <CAHk-=whtkzB446+hX0zdLsdcUJsJ=8_-0S1mE_R+YurThfUbLA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: CIFS <linux-cifs@vger.kernel.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	linux-afs@lists.infradead.org, Steve French <sfrench@samba.org>,
	v9fs-developer@lists.sourceforge.net, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH v2 07/67] fscache: Implement a hash
	function
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 9, 2021 at 1:57 PM David Howells <dhowells@redhat.com> wrote:
>
> What I'm trying to get at is that the hash needs to be consistent, no matter
> the endianness of the cpu, for any particular input blob.

Yeah, if that's the case, then you should probably make that "unsigned
int *data" argument probably just be "void *" and then:

>                 a = *data++;   <<<<<<<
>                 HASH_MIX(x, y, a);
>         }
>         return fold_hash(x, y);
> }
>
> The marked line should probably use something like le/be32_to_cpu().

Yes, it should be using a '__le32 *' inside that function and you
should use l32_to_cpu(). Obviously, BE would work too, but cause
unnecessary work on common hardware.

But as mentioned for the other patches, you should then also be a lot
more careful about always using the end result as an 'unsigned int'
(or maybe 'u32') too, and when comparing hashes for binary search or
other, you should always do th4e compare in some stable format.

Because doing

        return (long)hash_a - (long)hash_b;

and looking at the sign doesn't actually result in a stable ordering
on 32-bit architectures. You don't get a transitive ordering (ie a < b
and b < c doesn't imply a < c).

And presumably if the hashes are meaningful across machines, then hash
comparisons should also be meaningful across machines.

So when comparing hashes, you need to compare them either in a truly
bigger signed type (and make sure that doesn't get truncated) - kind
of like how a lot of 'memcmp()' functions do 'unsigned char'
subtractions in an 'int' - or you need to compare them _as_ 'unsigned
int'.

Otherwise the comparisons will be all kinds of messed up.

          Linus

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

