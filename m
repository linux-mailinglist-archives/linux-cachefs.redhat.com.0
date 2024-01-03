Return-Path: <linux-cachefs+bncBDLIXLMFVAERBO6Q2WWAMGQEU44NH7I@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D97822F06
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 14:59:25 +0100 (CET)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6800a9505ddsf154030756d6.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 05:59:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704290364; cv=pass;
        d=google.com; s=arc-20160816;
        b=NgrlBUR4kWVmf/3WOhVcN3oXm7TOxWDfbD0npc721/MFtMywuXq91dGQizGKSZK/l1
         MlkePksZR9fJi1DGjUbQZu5L1kHh38yyA2JVggJr9GLDO9mp6P7y6J6Ud/3WMOfQ4RbB
         ZBnqHyfZ9uNQCp2okb4GthjW+GgRxwrKf0k4dg2tznL5yixh3sb6b5We14HRTL0F98FN
         Bd4SSLHRDJIV1gRlALb42EWdceVlF05SO/gqaRQkzG83o0BV9pDL+BMSFY9/gd9eLlgc
         yjRWHqMi4VmnsiLi3oWat4ugnTt1N13nmzNt8FelOGAgf+oMtxom9X/1W4Ou+tjBgc4E
         AH5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=MTl3cvW9g8LtCjP7V7eAewQ4A60Ux3UhCl7MCBnt2Mg=;
        fh=BhDS1KcRJvXXD2Bl9bhuhq83dMEXwTkkC0RH5v6iCzY=;
        b=UhA+et3DbvqQkZszpjb2YhaWBjXJgeK+TlbbdGi1mLqqXpx3WSd3CPmcTLKdpbYEHM
         8zNl5EEM7mP3l3zHjCvyDleCD1B3vx91oxBZvtyeOSItqkONMF1QNM3SgmKwkb1xonlv
         kfc/lpi/zhazV5xT5eJvsqmpxt8A02F6S1JCsPHGBe7xQ7xd2ev5nnGX5o9eyfykIz+k
         myGCp46XQ79lYqPTNYAmaZqkFIZi+kcSMuR81+Li5lja5F+Y7nrMKbYy/ZH6wziN+lSv
         zC1TieQweUGKYDnI4kgmKCY1ILtiwiANf1qBkAZ5/+hKfPrYqAEOqM09Msa7Pgrzhqp7
         9W1g==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704290364; x=1704895164;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MTl3cvW9g8LtCjP7V7eAewQ4A60Ux3UhCl7MCBnt2Mg=;
        b=WTsl/63CaNZNrsiGAVoSMZdOMBTbtoSbwzTaAn3ZDiBMEAygVZhqMDuUQzOy4ZxrjW
         pe7N2wmRH0i2T4xxd+6BMwQcVM5C8xhdKO9/TWBiZf4sqLho2gBy4Vy6M1Gi9Q1TAU2d
         QBtAGCXZDdsbFSRzrP4S+NuB+P3kdb9nXty7753pz1jLG5082M60n3Z0bB0YWM5BnsJ2
         MmmAb2srZpapj3ctX/VwlQ3BEBFUTzB2bHUIm4jA5IliKgxQX8EesDXFxGYcbzin8aIc
         FFQGIzMME5LutBQEdEoR2oTdz/Fs2fGz/Mi72ok7tIWRPoD5Q2D//XKsdrOFny2qScuI
         aqcA==
X-Gm-Message-State: AOJu0YzcYJjz7IrwNGL6l5NByZh7H44f/U3FfuWVvVzu1ahsuZeEVIsm
	WIXCJ52MQHbBC/19u3DshFCtOmtN1UMpXA==
X-Google-Smtp-Source: AGHT+IEGRoEapoNEqErRRIoRbRNGxu0HJuHDjnkv674QpdEs4gduXbpY0UCZR6kFh9UCbEjEg34GCg==
X-Received: by 2002:a05:6214:23c5:b0:680:b0df:3b0e with SMTP id hr5-20020a05621423c500b00680b0df3b0emr5817862qvb.36.1704290364011;
        Wed, 03 Jan 2024 05:59:24 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:5fc7:0:b0:67e:f645:a2d1 with SMTP id jq7-20020ad45fc7000000b0067ef645a2d1ls127570qvb.2.-pod-prod-02-us;
 Wed, 03 Jan 2024 05:59:23 -0800 (PST)
X-Received: by 2002:a05:6102:2923:b0:467:98fb:4ffd with SMTP id cz35-20020a056102292300b0046798fb4ffdmr732441vsb.32.1704290363507;
        Wed, 03 Jan 2024 05:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704290363; cv=none;
        d=google.com; s=arc-20160816;
        b=w4pjXnv4mnQXaFlPdrudQv3dgPYm2HR9zPQ611pKzqLI2zT3OVvqZUwyVhD4NfAXYx
         J52Legx9ezL1B+EGxEtalk9UWVVj3jgV1O1PtzWj+lUMtZJKex3NF1fzKC2S8tugSAMa
         4luO0K356SwAGzC68ZdF1dZCwrTPwePccUAMBcS2pqAKmKlNUsVINbLXA6MMpJCWT043
         FkU9vOytKAwrUAdj2efU2E6NWE2MInucA67GRIl2Da+a7UVlOF8vURL4/9BRxWOrJEqA
         JlJda141G8YsT7/Y//J5V0qo6UD7fQh3oVaZkr+MLvihcvkDTQA+547btMff7K5pjJZK
         Evjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=6dAWkrI8v4YS0rv7Bi/6xzx13i604x2fNTwwBvd0CnM=;
        fh=BhDS1KcRJvXXD2Bl9bhuhq83dMEXwTkkC0RH5v6iCzY=;
        b=Z+YprCh2C4jrHBvwu3dfkbxzR0z6Y4BKg4TTRbDAFNBWBhdB8t6mc8sdzFRG+A0cdC
         jvugFBbDPri4awAmnmRAEuH8cgbzBxj/uFhnYkYHt6RV/b/XCwnjGioKaa8xKVX5m9UP
         IBQbvPW9Io4tBJHq1C2UoDL8Xq961cSXgCP3qtQ4zOJUp40QYI15ZnzVfnMYU5GacgVO
         G10RXcvcBOakVEYja5m/ybDsBy81j8/b3suz+BxksHPdTmKbIWzh43Iza9UmeZBHUOYx
         RzpQGgiaHXucUQl1fvddZDieqBnPW+GjGbALC2VkCT/Twa8LuwQ7Vi1FhKX5EL1lZidU
         9xMg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g4-20020ac87f44000000b00425f24df298si30561964qtk.548.2024.01.03.05.59.23
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:59:23 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-UeXHO96dMRepYp9wpjtLMg-1; Wed,
 03 Jan 2024 08:59:22 -0500
X-MC-Unique: UeXHO96dMRepYp9wpjtLMg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26E728EC103
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 13:59:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id EF5D140C6E2B; Wed,  3 Jan 2024 13:59:21 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5F0940C6EB9;
	Wed,  3 Jan 2024 13:59:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZVctju5TEjS218p@codewreck.org>
References: <ZZVctju5TEjS218p@codewreck.org> <20231221132400.1601991-41-dhowells@redhat.com> <20231221132400.1601991-1-dhowells@redhat.com> <292837.1704232179@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: dhowells@redhat.com, Eric Van Hensbergen <ericvh@kernel.org>,
    Latchesar Ionkov <lucho@ionkov.net>,
    Jeff Layton <jlayton@kernel.org>, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH] 9p: Fix initialisation of netfs_inode for 9p
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 13:59:18 +0000
Message-ID: <357813.1704290358@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <357812.1704290358.1@warthog.procyon.org.uk>
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

Dominique Martinet <asmadeus@codewreck.org> wrote:

> Would it make sense to just always update netfs's ctx->remote_i_size in
> the various stat2inode calls instead?

Yeah, that's probably a good idea.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

