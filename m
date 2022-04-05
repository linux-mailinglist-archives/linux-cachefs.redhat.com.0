Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 666364F37D2
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Apr 2022 16:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649168734;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IGtcSwdPM09KGZXj80a7Zlco8fV5gtDrLViK8g0GKeU=;
	b=FotEnNt68MQ7S1X4Btt32e8uYgn2ofydlypKDXqUjRHTRbRX/lcD/N/Ww0F6B6v4rvOgLq
	FT1HP2AHVugJoaQ21jOpuOIIErKv2h6UxhTULELjyviLXujqlUprYW8cckJjupuF7tRlzX
	kBdWUuRB2y5P3KaE87I0w3DBI0lgVTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-K5u_MybVMHWYh0sfpweTrw-1; Tue, 05 Apr 2022 10:25:31 -0400
X-MC-Unique: K5u_MybVMHWYh0sfpweTrw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12252811E76;
	Tue,  5 Apr 2022 14:25:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 007FB112C082;
	Tue,  5 Apr 2022 14:25:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B8407194036C;
	Tue,  5 Apr 2022 14:25:30 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59D391947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Apr 2022 14:25:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3AD20112C083; Tue,  5 Apr 2022 14:25:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3738D112C082
 for <linux-cachefs@redhat.com>; Tue,  5 Apr 2022 14:25:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E018100BAA5
 for <linux-cachefs@redhat.com>; Tue,  5 Apr 2022 14:25:29 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-g4SHdoOiNXyT3aYAa9_JJw-1; Tue, 05 Apr 2022 10:25:27 -0400
X-MC-Unique: g4SHdoOiNXyT3aYAa9_JJw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i13-20020aa7dd0d000000b0041ccfefe3f4so3751459edv.14
 for <linux-cachefs@redhat.com>; Tue, 05 Apr 2022 07:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lXEk4r5B+cka/wL2y/xk5o9ZYEMsta/GUz68S3KhUi0=;
 b=W3OSgI7hr55VKdjqOiunQ/oV+fA5+/NAS7ErJHmfasBRpZHj4Jnorg/rIL81pkJeZX
 FYcbw50Os56UhgLWqlupdSfhYf9ayodUCG6XzHeN00SJtQAPiprxXiavhR5+6H6OQmV7
 wXhg58XB1hKqby88H7KPYV9zucf5W2YWovZLfCn3jlDqK7lfmZhTloM0TqhnRM1dh70U
 veVu7/MX6s/gu+NRWO0zz/ApSq/xHI0F9tVKoRFYLkAhz/Yi6uNQJov5mx5N8nLjdGfj
 +X77WQ4tYyZL/AVtDYjnu44tmVUha1g4K2bUZqe/CcAVh9ZRtcLDY3K12pBmO04RadJ7
 SHgg==
X-Gm-Message-State: AOAM530bGBZjdiAQ5ZbJYyOpKiBJMKziJwea9Txn+XfFbexGNnW+3apy
 qVnKxlvK73E7BAjdTAV/gsev0aGMh4asfBsVn2jaMFH4+r3s5QK6kjLY3FFK/jfePE2niegYK3g
 kkgxsOsr1SoG4v5BhXLpG8SpaxZRZiJ+3esrTPg==
X-Received: by 2002:a17:906:730e:b0:6e0:2ad8:12c8 with SMTP id
 di14-20020a170906730e00b006e02ad812c8mr3746282ejc.623.1649168726700; 
 Tue, 05 Apr 2022 07:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz68uG1mxG0zhvCsWepmJDyuPxO7TopiduJMPOjqh2x+Ha7oAKYaIKPvrRT/trlUlFs3Vw8MNMJ0xIMK077r28=
X-Received: by 2002:a17:906:730e:b0:6e0:2ad8:12c8 with SMTP id
 di14-20020a170906730e00b006e02ad812c8mr3746254ejc.623.1649168726397; Tue, 05
 Apr 2022 07:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220405134649.6579-1-dwysocha@redhat.com>
 <1788451.1649168050@warthog.procyon.org.uk>
In-Reply-To: <1788451.1649168050@warthog.procyon.org.uk>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 5 Apr 2022 10:24:50 -0400
Message-ID: <CALF+zOn+JEB7F30wMEcs3Zm=2HFMXS+8vfiQP9HW26OtwXUHGg@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Fix KASAN
 slab-out-of-bounds in cachefiles_set_volume_xattr
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
Cc: Steve French <smfrench@gmail.com>, linux-cachefs <linux-cachefs@redhat.com>,
 Jeff Layton <jlayton@kernel.org>, linux-cifs <linux-cifs@vger.kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 5, 2022 at 10:14 AM David Howells <dhowells@redhat.com> wrote:
>
> Dave Wysochanski <dwysocha@redhat.com> wrote:
>
> > @@ -203,7 +203,7 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
> >       if (!buf)
> >               return false;
> >       buf->reserved = cpu_to_be32(0);
> > -     memcpy(buf->data, p, len);
> > +     memcpy(buf->data, p, volume->vcookie->coherency_len);
>
> Good catch.  However, I think it's probably better to change things a bit
> further up, eg.:
>
>         -       len += sizeof(*buf);
>         -       buf = kmalloc(len, GFP_KERNEL);
>         +       buf = kmalloc(sizeof(*buf) + len, GFP_KERNEL);
>
> David
>

Agree with the above.  I'll send a v2.  Thanks!

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

