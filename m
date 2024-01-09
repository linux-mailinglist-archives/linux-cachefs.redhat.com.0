Return-Path: <linux-cachefs+bncBDLIXLMFVAERBNGS6SWAMGQEMGHYFOQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F682847B
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:08:38 +0100 (CET)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-20461f367cdsf2390628fac.3
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:08:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704798517; cv=pass;
        d=google.com; s=arc-20160816;
        b=QEiTAd+qz5ZglqAw+dpsQa+x7GUXFjrW+IHX4gXgpXgFtnd9aMGCb47E4IEN3LLaYQ
         6KeyuSwK7ngA/ZqtmoyxvDaJorihxgUiXsGoVPAkjNczw/C2WB0OssmjQ3jSizlKPyoo
         nXa/Nsvj44qEmgg18d7FbeVZAwhE9x+stzUO/dnieJvvMMFlQapFgRUONPVwy2R+9Vwj
         jtmDUbx0+TlTN7yhHyiwZO6fspPnYAz+sWSJGf23SYytr7nun2Oaa0dHRGFPfjfV1RVc
         P+1omhx7LZDuxzCg+XQJOHFElqQZDSX7YD1eGT8n0nuoJahXUybUiJPydj/fYkaUao45
         NnTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=TcFnTbFHjKZo6hKOCIv70N4qx/M03HN/BNtCr5/WU6M=;
        fh=rKd/HKm5u0owWI9P/ygl/0f5YWZp6uiBCbTyoPKBYRw=;
        b=yjrQOfd2B/bsnyrWZvw/htZlvZqud8L7yq/eL8bUGy5iGgEgTs6hpffuiSyuRB1oM3
         2ergSQFHCJklSzyNVKlqSPVTsJ5yS++ddK98W6+jzJ/YiaaADv+PYbp5+KrHkXcS8M0I
         Qq3uChFrlLhrbz//+e4wIuWZaq0QLYVdx7NNozvu1jHFkm1PBar7cFyNsGJBs+514Fr1
         7Bvbknn9Jen879njNPgQ2R0QeEA/4cNazV7HS4rRGYa2a5Sg3jko8PaxwDqbQxubFOv4
         r+DW1oTIcO/I5LexvHwftLGJqu7B3eTLo4RCj/qTS1HGB2ViYe/ozWIJoTmGsbeqjTyk
         8IBg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704798517; x=1705403317;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TcFnTbFHjKZo6hKOCIv70N4qx/M03HN/BNtCr5/WU6M=;
        b=dMpMXunG8tWPRnizjbQhgnAa1tG9ktZC0SPEyXP96nHby2MGud50CMqLuGm67oszN6
         EmzC+6YtB9CGcj/tvLnew6Ql3antCqX8ceLwI5zxOp+1/mjtPkqm3R5KmifOBxuTkQ7T
         GpQoxHHiAT/0KI8AhU3r/dlts8gcsQ9yg/l7gPANlTGXx2SZYelOryyNUVoAPxCyCFfv
         buUMYVxS8ibn0pvDzTRIgwb73cu+yGBOXXihOzTpdS6dPjpEbL9EGY4tIEJpXNKLg7s4
         V0xoInqlE/Au90uq/mpscOwn1auatHNcLSUL8fb85KWWLySiib1mdIqpOv02NarctWvX
         p/yw==
X-Gm-Message-State: AOJu0YybYUkdtI/dkvQMr+zrmZvEE1W99mGgEkcm++ONCM3UqjTJyeL3
	vz64KjvnSSkO2s91fE0Ki722u2+NPmY9xA==
X-Google-Smtp-Source: AGHT+IGf52PPgwHbI7epkfVelHxuaHzaWXVPzhbBGUD116fCqIzXXYG0vWMpf9RFerx+J1G8vs4yew==
X-Received: by 2002:a05:6871:3745:b0:203:bfe3:b2ca with SMTP id np5-20020a056871374500b00203bfe3b2camr2503574oac.119.1704798516990;
        Tue, 09 Jan 2024 03:08:36 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6871:486:b0:204:3c56:3ce0 with SMTP id
 f6-20020a056871048600b002043c563ce0ls1786728oaj.2.-pod-prod-06-us; Tue, 09
 Jan 2024 03:08:36 -0800 (PST)
X-Received: by 2002:a05:6870:46ab:b0:204:34f0:b86d with SMTP id a43-20020a05687046ab00b0020434f0b86dmr2504788oap.78.1704798516240;
        Tue, 09 Jan 2024 03:08:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704798516; cv=none;
        d=google.com; s=arc-20160816;
        b=lIpDy/j7MpjbA3Ogs/h1psA//7SngXwyIdVyqLO1AS2V07VRCF6myjY8BVxzj4PLE2
         v6tk9mXprBme//4EOE1I1iqcXTqPi0dUguS0jlaljk+AHLDrMPee2zOC0qUOCZPQ0B/y
         4TKUCZekJTIE20abeqFDpKD2MUDHTm2M00+wEliw50lrnkJ8My/Ynf/xYFb0IsHJ0is5
         sZElNr4VDl7RC3GVmv/QfhlclxMUCOG8PcYPj0XkVVtWr204i28ZammQg0hV+UZwkLW2
         BS/kHZkt4YQxeoKQpnsJLfZzwOskOHaeO9DzyviPVQeLHd6Jwr2SNbX4+g3FXzHfMBx2
         3gqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=jVq6Bvt43xx2ZZr7NjW5k0lYlPpCHdUkD3QuDPePB8I=;
        fh=rKd/HKm5u0owWI9P/ygl/0f5YWZp6uiBCbTyoPKBYRw=;
        b=PHh0Er1XoPvpl0ZlKjYmQ2jee0xaRHiOfVEuVpsb0Iv0sKuUbkYlO9/z9Qb+rAsc/g
         30gpCoghOKWoyM6Q8WBKcuajUR5BEn8P2rrufa4hp9hMndtWd8YimiUleqOcjLn2QsFN
         UtB2pEUYbWLzPnufwoUgpD59g+Z1VjeJafjrKfsgQKM6AGv31gCGtvJ9KoYGaM0qS54L
         5MjZUPDVsYdpFyZFrs/qgmcd/db2jwjM/5ti1p2iWDGdomv3/cBfNPyH9QLrgWgpaBoC
         QuKQmYVMnnQQhZTTjvbj31Cu69BdlODFnsyE1SvMKNN00HGoPBm+wgh0hRNbp7lU7Co3
         Kv8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id s13-20020a05620a0bcd00b007830f6d1588si1841789qki.4.2024.01.09.03.08.36
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:08:36 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-HlyDvY6WOP2OWaXiTkgEKg-1; Tue,
 09 Jan 2024 06:08:33 -0500
X-MC-Unique: HlyDvY6WOP2OWaXiTkgEKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BCD738041C5
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:08:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5869F40C6EBA; Tue,  9 Jan 2024 11:08:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83E3740C6EB9;
	Tue,  9 Jan 2024 11:08:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZyCTPz+uuvgjPIL@casper.infradead.org>
References: <ZZyCTPz+uuvgjPIL@casper.infradead.org> <CAKXUXMzXN=+hKDPP-RdHKELA_fGA6PcdCj5fXM32qh4Px0Hprg@mail.gmail.com> <1542013.1704750095@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
Cc: dhowells@redhat.com, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
    linux-cachefs@redhat.com,
    linux-fsdevel <linux-fsdevel@vger.kernel.org>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Reference to non-existing CONFIG_NETFS_FSCACHE
MIME-Version: 1.0
Date: Tue, 09 Jan 2024 11:08:31 +0000
Message-ID: <1571880.1704798511@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1571879.1704798511.1@warthog.procyon.org.uk>
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

Matthew Wilcox <willy@infradead.org> wrote:

> > netfs_writepages_begin() has the wait on the fscache folio conditional on
> > CONFIG_NETFS_FSCACHE - which doesn't exist.
> > 
> > Fix it to be conditional on CONFIG_FSCACHE instead.
> 
> Why is it conditional at all?  Why don't we have a stub function if
> CONFIG_FSCACHE is not defined?

At this point, I'd rather just change the #ifdef and then (hopefully) next
cycle get rid of PG_fscache entirely, rendering this unnecessary.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

