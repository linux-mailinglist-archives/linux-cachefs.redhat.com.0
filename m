Return-Path: <linux-cachefs+bncBDLIXLMFVAERBXOIXKWQMGQECXAC26Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BCD836D01
	for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 18:22:39 +0100 (CET)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-598f16fe376sf2827001eaf.3
        for <lists+linux-cachefs@lfdr.de>; Mon, 22 Jan 2024 09:22:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705944158; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fn9iwUBM0ogzzqfJ/VyexSAAbFex4VI79guriZHmaoSxqCIvq+U9LLvm4oellC0gNI
         jSwZgX85Yk2yw/2xVCjWD9C9KbLi2VCIOYtWg4kkinFFmBkOF43cnnHronBQzHNkr2C0
         np/+spzYmQ2/xnpUZXIRJtgVD/3NAvVuiiiF/PQ9fow6afdcUy+snudiUHwUD/Pg/bqx
         NikoOy4L/WDESq4dHiaAeTTVF/SEr2dct+GuNnDFA9+S9nPMtMekMhBh/uXxrjIzuDFl
         /2Z5u4VIiv/bhBPuTnG8SgEZHFcDyD9npDtWyjkOiVNv3DdkO9C3guWpsWs9oxXRp9yC
         C/PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=OEvX/fwGUOVi4gUOxtbAFd5Im2xXZ4EmBHB3godR93E=;
        fh=Ph6VZv6MXJyRK/pn/hD9UXWngPrkzZweiT2/hdC+jWk=;
        b=z1OkyhL3N/YdAKI/lbPVNxaSGUoySVFt85RSoB9rbVEz7AdVk+TCYtwBPvLB68c7uy
         uTHI3iagYCIVUb6kP/OFKjTOOGE+st7eiPvjlU+iOtWzDkjQ7WmUpoTYlTZTixqdoexj
         I6F6eKgCDUKhObu1c9OcA+HF8FQ72fjHbfBrv9Z2xtO1i0IYvmwY+ot1h32Z6K6saKkL
         OHrDgAQMPh4hNIMZN2mQ7SgD3N2JxonR6T/dImkef6X1VFidkuT0j6QxRfe3Q+yY3bru
         NKqbY8cNMOChbc7dqE5qR1zPEP9YcktwK7m5gg+1TkFlayB4XRFVdSFQanTk5haKNvrP
         QEXA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705944158; x=1706548958;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OEvX/fwGUOVi4gUOxtbAFd5Im2xXZ4EmBHB3godR93E=;
        b=vica7aDQuA70aorO9TYIVLQ4xGlN5/0DnAyiQ/8p40me3OPe/yRz+0WnfF3KUGMThn
         ly7zS5OgbiKrnYky+3o6nm6l9yW56PGXXxcJcBPWMHf3YXfnp+cCtQPEySfEt0lDZRNX
         lYuqb1goI1lvimZ49Cfl1/g6nJoxu3Hhs1u9DSvj+qWncfMkDPXM5500nqVy21L0BklS
         Gl89FJNuHMQRi70jO0mx9ATsmsgEzPHCNQn5tJOhECNsi3AwMWoSk5KOZggURdhMawPD
         pgR8nKGpbRmglsSaMXirsZcFAzXJei5tGQGa2ZTi05T4w7vU3OsechJQdnicTDtBny7x
         5DHA==
X-Gm-Message-State: AOJu0Yxjgyf71LL+DiKh1GRuegCEvTXw3VXUqKoBIPLvrMv4/w4KImzx
	5JyUb7bY4gh4CYNM9A2/tTAtzMIaAIDu+4VvBg2uEcoSjyiSrZATORy0wFf+b1w=
X-Google-Smtp-Source: AGHT+IGSYWh/NQl6NPIVUFzMXWbVop+e0xgdx0YyNoCzBTXLwlHidHaJm0N7qOohXt4L40tS+fWm4w==
X-Received: by 2002:a4a:d393:0:b0:599:938a:5acb with SMTP id i19-20020a4ad393000000b00599938a5acbmr939514oos.0.1705944157784;
        Mon, 22 Jan 2024 09:22:37 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:e834:0:b0:598:dc0d:33b6 with SMTP id d20-20020a4ae834000000b00598dc0d33b6ls161700ood.2.-pod-prod-03-us;
 Mon, 22 Jan 2024 09:22:37 -0800 (PST)
X-Received: by 2002:a05:6358:ee44:b0:175:8c20:cad with SMTP id ik4-20020a056358ee4400b001758c200cadmr3061763rwb.0.1705944157128;
        Mon, 22 Jan 2024 09:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705944157; cv=none;
        d=google.com; s=arc-20160816;
        b=buKiPjfnP8esJivjh/I55u1J1IJfpiXJcFo+gGG0AxSkK2jN4ilJQChq7XRXuOaD4S
         DPDf8ZN/5bO8V8jq9MVWjkEY+q9rjBFw0eO0tTXk7POwtmyFjOoLHy+T9ay+702AZoP1
         RDdSCUB5Lm3g/H8U/KZWZ17GLV0YC0i1HH2WKaOwGrgQIrLeAbz5CEKYwKdEVdzUgZgY
         zbX0RPc84QPJ588iibO7HOYroWdozB6y6ndXSPBXqdI8t79G5vmKbDXuyddFvKB/HuKn
         2jDiACsoVAlGwA0+68fJ0s/STV/k5YilC+9N+DUXEBXcdQviLvtKIoPJuxDnhTcUekCh
         dGtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=dyL8HkrfuDx15VmmUYeIG1cK/wCgWeV9TZeHPttzNv8=;
        fh=Ph6VZv6MXJyRK/pn/hD9UXWngPrkzZweiT2/hdC+jWk=;
        b=o027lQfD8YLXvsm/1FML2wSUVM0GZWLszAMF4nnEevTONbyaENzHbEe5CU66PjRRon
         D/ePlISqkQPkhuG043k8TGnoXsnMcNLkTY6WJJbKQlIiyGQW4FDNYDU4AepI1RM8AwmX
         MokjjApIRlIFUBrvnGdJf+y6LxQdLAe94Pf40JeZx8VneoXo9dFfC1f6nExEL5Ii++wN
         lbgIQ51O2vmPgJYXvvAcYk5q21JoGduMuMIuaRxQmy8VXy1WzWSQcoVV7SJZj5vgcCVD
         P86dvBAOKzRw/1pylxhCdGaiA8nw5kmXRHGjM5TK+XxF1JhXzMJJFNejxkUz42tkfUNU
         QHyw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id d7-20020a0cdb07000000b00681991462adsi6170036qvk.273.2024.01.22.09.22.37
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 09:22:37 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-580-pugqau7VNC2neLXQSZaoAw-1; Mon,
 22 Jan 2024 12:22:34 -0500
X-MC-Unique: pugqau7VNC2neLXQSZaoAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A72C1285F983
	for <linux-cachefs@gapps.redhat.com>; Mon, 22 Jan 2024 17:22:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A44D3C0FDCC; Mon, 22 Jan 2024 17:22:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2C10C0FDCA;
	Mon, 22 Jan 2024 17:22:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <c9091df8de30a2c79364698b72e67834d0ac87c7.camel@kernel.org>
References: <c9091df8de30a2c79364698b72e67834d0ac87c7.camel@kernel.org> <20240122123845.3822570-1-dhowells@redhat.com> <20240122123845.3822570-2-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Matthew Wilcox <willy@infradead.org>, netfs@lists.linux.dev,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-erofs@lists.ozlabs.org,
    linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
    linux-kernel@vger.kernel.org, linux-cachefs@redhat.com
Subject: Re: [PATCH 01/10] netfs: Don't use certain internal folio_*() functions
MIME-Version: 1.0
Date: Mon, 22 Jan 2024 17:22:32 +0000
Message-ID: <3931926.1705944152@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3931925.1705944151.1@warthog.procyon.org.uk>
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

Jeff Layton <jlayton@kernel.org> wrote:

> > Filesystems should not be using folio->index not folio_index(folio) and
> 
> I think you mean "should be" here.

Ach.  I forgot to update the patch descriptions!

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

